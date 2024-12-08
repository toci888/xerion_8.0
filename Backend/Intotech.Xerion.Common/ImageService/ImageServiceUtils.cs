using Intotech.Common;
using Intotech.Xerion.Common.Interfaces;

namespace Intotech.Xerion.Common.ImageService;

public static class ImageServiceUtils
{
    private const string Salt = "ItsForbiddenToLoadRandomImages";

    public static string GetImageUrl(int accountId)
    {
        string token = HashGenerator.Md5(string.Format("{0}_{1}", Salt, accountId));

        return CommonConstants.ServerUrl + ":5072/image?dataId=" + accountId + "&queryValid=" + token;
    }
}