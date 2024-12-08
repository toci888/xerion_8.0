using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Bll.Models.Accounts;
using Intotech.Xerion.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Interfaces.Accounts;

public interface IAccountService : IManager
{
    ReturnedResponse<AccountRoleDto> Register(AccountRegisterDto sAccount);

    ReturnedResponse<AccountRoleDto> Login(LoginDto loginDto);

    ReturnedResponse<AccountRoleDto> GlfLogin(Accountrole accountrole);

    ReturnedResponse<AccountRoleDto> ConfirmEmail(EmailConfirmDto EcDto);

    ReturnedResponse<Account> ChangeRole(Account account);

    ReturnedResponse<GetAccountCompleteDto> GetAccountById(int id);

    ReturnedResponse<AccountCompleteDto> UpdateAccountById(AccountCompleteDto account);

    ReturnedResponse<bool> SetAllowsNotifications(int accountId, bool allowsNotifications);

    ReturnedResponse<int?> ResetPasswordCheckCode(string email, string verificationCode);

    ReturnedResponse<int?> ResetPassword(string email, string password, string token);

    ReturnedResponse<TokensModelDto> CreateNewAccessToken(string accessToken, string refreshToken);

    ReturnedResponse<int?> ForgotPassword(string email);

    ReturnedResponse<bool> ResendEmailVerificationCode(string email);
}