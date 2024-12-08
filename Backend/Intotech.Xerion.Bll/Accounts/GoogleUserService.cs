using Intotech.Xerion.Bll.Models.Accounts;
using Intotech.Xerion.Database.Persistence.Models;
using System.Text.Json;
using Intotech.Common;
using Intotech.Common.ImageManagement;
using Intotech.Xerion.Bll.Persistence.Interfaces;
using Intotech.Xerion.Common.Interfaces;

namespace Intotech.Xerion.Bll.Accounts;

public class GoogleUserService : GlfServiceBase<GoogleUserDto>
{
    protected IAccountLogic AccountLogic;
    protected IUserExtraDataLogic UserExtraDataLogic;
    protected ImageManager ImageManager;

    public GoogleUserService(IAccountLogic accountLogic, IUserExtraDataLogic userExtraDataLogic) : base("https://www.googleapis.com/")
    {
        AccountLogic = accountLogic;
        UserExtraDataLogic = userExtraDataLogic;
        ImageManager = new ImageManager();
    }

    public override GoogleUserDto GetUserByToken(string token)
    {
        string json = Request(token, "userinfo/v2/me");

        GoogleUserDto dto = JsonSerializer.Deserialize<GoogleUserDto>(json);

        if (dto.email == null)
        {
            return null;
        }

        dto.Json = json;

        string[] nameSurname = dto.name.Split(" ");

        string name = string.Empty;
        string surname = string.Empty;

        if (nameSurname.Length == 2)
        {
            name = nameSurname[0];
            surname = nameSurname[1];
        }

        Account acc = AccountLogic.Select(m => m.Email == dto.email).FirstOrDefault();

        if (acc != null)
        {
            Userextradatum userExtra = UserExtraDataLogic.Select(m => m.Idaccount == acc.Id).FirstOrDefault();

            if (string.IsNullOrEmpty(acc.Name) && string.IsNullOrEmpty(acc.Surname))
            {
                acc.Name = name;
                acc.Surname = surname;
            }

            acc.Image = ImageManager.GetImageBase64(dto.picture);

            AccountLogic.Update(acc);

            if (userExtra == null)
            {
                UserExtraDataLogic.Insert(new Userextradatum() { Idaccount = acc.Id, Origin = CommonConstants.GoogleOrigin, Token = token, Tokendatajson = json });
            }
        }
        else
        {
            string refreshToken = StringUtils.GetRandomString(AccountLogicConstants.RefreshTokenMaxLength);
            DateTime refreshTokenValid = DateTime.Now.AddDays(AccountLogicConstants.RefreshTokenValidDays);

            acc = AccountLogic.Insert(new Account()
            {
                Email = dto.email,
                Emailconfirmed = dto.verified_email,
                Idrole = CommonConstants.RoleUser,
                Image = ImageManager.GetImageBase64(dto.picture),
                Name = name,
                Surname = surname,
                Refreshtokenvalid = refreshTokenValid,
                Refreshtoken = refreshToken
            });

            UserExtraDataLogic.Insert(new Userextradatum() { Idaccount = acc.Id, Origin = CommonConstants.FacebookOrigin, Token = token, Tokendatajson = json });
        }

        return dto;
    }
}