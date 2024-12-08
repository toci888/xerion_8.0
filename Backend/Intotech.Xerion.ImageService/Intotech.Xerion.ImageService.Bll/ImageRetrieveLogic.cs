using Intotech.Common;
using Intotech.Xerion.Bll.Persistence.Interfaces;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.ImageService.Bll;

public class ImageRetrieveLogic
{
    private const string Salt = "ItsForbiddenToLoadRandomImages";

    protected IAccountLogic AccountLogic;

    public ImageRetrieveLogic(IAccountLogic accountLogic)
    {
        AccountLogic = accountLogic;
    }

    public virtual string GetImageForUser(int accountId, string authToken)
    {
        if (!VerifyToken(accountId, authToken))
        {
            return string.Empty;
        }

        Account acc = AccountLogic.Select(m => m.Id == accountId).FirstOrDefault();

        if (acc != null)
        {
            return acc.Image;
        }

        return string.Empty;
    }

    protected bool VerifyToken(int accountId, string authToken)
    {
        return authToken == HashGenerator.Md5(string.Format("{0}_{1}", Salt, accountId));
    }
}