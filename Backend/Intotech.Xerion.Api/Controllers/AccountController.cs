using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Intotech.Common.Microservices;
using Intotech.Xerion.Bll.Interfaces.Accounts;
using Intotech.Xerion.Bll.Models.Accounts;
using Intotech.Xerion.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Common;
using Intotech.Xerion.Common.I18n;
using Intotech.Xerion.Common.Interfaces;
using Intotech.Xerion.Database.Persistence.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Intotech.Xerion.Api.Controllers;

[Route("api/[controller]")]
[ApiController]
public class AccountController : XerionApiSimpleControllerBase<IAccountService>
{
    protected IGlfManager GlfManager;

    public AccountController(IAccountService service, IGlfManager glfManager, IHttpContextAccessor httpContextAccessor) : base(service, httpContextAccessor)
    {
        GlfManager = glfManager;
    }

    [HttpPost("register")]
    public ReturnedResponse<AccountRoleDto> Register(AccountRegisterDto sa)
    {
        ReturnedResponse<AccountRoleDto> reg = Manager.Register(sa);

        return reg;
    }

    [HttpPost("login")]
    public ReturnedResponse<AccountRoleDto> Login(LoginDto lDto)
    {
        if (lDto.Method == "facebook" || lDto.Method == "google")
        {
            Accountrole result = GlfManager.RegisterByMethod(lDto.Method, lDto.Token);

            if (result == null)
            {
                return new ReturnedResponse<AccountRoleDto>(null, I18nTranslationDep.Translation(I18nTags.WrongData), false, ErrorCodes.DataIntegrityViolated);
            }

            return Manager.GlfLogin(result);
        }

        ReturnedResponse<AccountRoleDto> sa = Manager.Login(lDto);

        return sa;
    }

    // [Authorize(Roles = "User")]
    [HttpPut("change-role")]
    public ReturnedResponse<Account> ChangeRole(Account account)
    {
        return Manager.ChangeRole(account);
    }

    [HttpPost("confirm-email")]
    public ReturnedResponse<AccountRoleDto> ConfirmEmail(EmailConfirmDto EcDto)
    {
        return Manager.ConfirmEmail(EcDto);
    }

    [HttpPost("refresh-token")]
    public ReturnedResponse<TokensModelDto> CreateNewAccessToken([FromBody] TokensModelDto tokensModel)
    {
        return Manager.CreateNewAccessToken(tokensModel.AccessToken, tokensModel.RefreshToken);
    }

    [AllowAnonymous]
    [HttpPost("reset-password")]
    public ReturnedResponse<int?> ResetPassword(ResetPasswordDto dto)
    {
        return Manager.ResetPassword(dto.email, dto.password, dto.token);
    }

    [HttpPost("forgot-password-check-code")]
    public ReturnedResponse<int?> ResetPasswordCheckCode(EmailTokenDto emailToken)
    {
        return Manager.ResetPasswordCheckCode(emailToken.email, emailToken.token);
    }

    //[HttpPatch("{idAccount}/settings/notifications")]
    //public ReturnedResponse<bool> SetAllowsNotifications(int idAccount, [FromBody] NotificationsModel allowsNotifications)
    //{
    //    return Service.SetAllowsNotifications(idAccount, allowsNotifications.AreNotificationsEnabled);
    //}

    [HttpPost("forgot-password")]
    public ReturnedResponse<int?> ForgotPassword([FromBody] EmailDto email)
    {
        return Manager.ForgotPassword(email.email);
    }

    [HttpPost("resend-email-verification-code")]
    public ReturnedResponse<bool> ResendEmailVerificationCode([FromBody] EmailDto email)
    {
        return Manager.ResendEmailVerificationCode(email.email);
    }

    [HttpGet("get-account-by-id")]
    public ReturnedResponse<GetAccountCompleteDto> GetAccountById(int id)
    {
        return Manager.GetAccountById(id);
    }

    //[Authorize(Roles = "User")]
    [HttpPatch("update-account-by-id")]
    public ReturnedResponse<AccountCompleteDto> UpdateAccountById([FromBody] AccountCompleteDto account)
    {
        var user = HttpContext.User;

        //if (user.Identity.IsAuthenticated)
        //{
            if (account.Account.Email == user.FindFirst(ClaimTypes.NameIdentifier)?.Value)
            {
                return Manager.UpdateAccountById(account);
            }
        //}

        return null;
    }
}
