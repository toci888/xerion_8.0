namespace Intotech.Xerion.Common.Interfaces.Emails;

public interface IEmailManager
{
    bool SendEmailVerificationCode(string emailTo, string userName, string verificationCode);
    bool SendPasswordResetVerificationCode(string emailTo, string userName, string verificationCode);
}