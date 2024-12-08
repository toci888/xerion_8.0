using Intotech.Xerion.Bll.Interfaces.Accounts;
using Intotech.Xerion.Bll.Models.Accounts;
using Intotech.Xerion.Bll.Persistence.Interfaces;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Accounts;

public class GlfManager : IGlfManager
{
    //protected IUserExtraDataLogic LUserExtraDataLogic;
    protected IAccountRoleLogic AccLogic;
    protected GlfServiceBase<FacebookUserDto> FbGlfService;
    protected GlfServiceBase<GoogleUserDto> GoogleGlfService;

    public GlfManager(
        //IUserExtraDataLogic lUserExtraDataLogic, 
        IAccountRoleLogic accLogic,
        GlfServiceBase<FacebookUserDto> fbGlfService,
        GlfServiceBase<GoogleUserDto> googleGlfService)
    {
        //LUserExtraDataLogic = lUserExtraDataLogic;
        AccLogic = accLogic;
        FbGlfService = fbGlfService;
        GoogleGlfService = googleGlfService;
    }

    public virtual Accountrole RegisterByMethod(string method, string token)
    {
        if (method == "google")
        {
            GoogleUserDto dto = GoogleGlfService.GetUserByToken(token);

            if (dto == null)
            {
                return null;
            }

            return AccLogic.Select(m => m.Email == dto.email).FirstOrDefault();
        }

        if (method == "facebook")
        {
            FacebookUserDto dto = FbGlfService.GetUserByToken(token);

            if (dto == null)
            {
                return null;
            }

            return AccLogic.Select(m => m.Email == dto.email).FirstOrDefault();
        }

        return null;
    }
}