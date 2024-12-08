using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Common.I18n;
using Intotech.Xerion.Common.Interfaces.Emails;

namespace Intotech.Xerion.Common.Emails;

public class EmailManager : IEmailManager
{
    protected string LanguageCode;
    protected EmailSender EmailMsgSender = new EmailSender();
    public const string EmailFrom = "check.yourself@gmail.com";

    public EmailManager(string languageCode)
    {
        LanguageCode = languageCode;
    }

    protected Dictionary<string, Dictionary<string, Func<List<string>, string>>> MessagesLanguageMap = new Dictionary<string, Dictionary<string, Func<List<string>, string>>>()
        {
            { I18nTags.LanguageCodePl, new Dictionary<string, Func<List<string>, string>>()
                {
                    { I18nEmailMessagesTags.EmailVerificationCode, (data) => string.Format("Witaj {0}. W celu potwierdzenia Twojego adresu email kliknij </br> " +
                        "<a href=\"http://20.215.201.170/email-verification/{1}/{2}\" class=\"button\">tutaj.</a>", data[0], data[1], data[2]) },
                    { I18nEmailMessagesTags.PasswordResetEmailVerificationCode, (data) => string.Format("Witaj {0}, niniejszym przesyłamy kod potwierdzenia zmiany hasła Twojego adresu email: {1}.", data[0], data[1]) }
                }
            },
            { I18nTags.LanguageCodeEn, new Dictionary<string, Func<List<string>, string>>()
                {
                    { I18nEmailMessagesTags.EmailVerificationCode, (data) => string.Format("Hello {0}, we hereby send you the email verification code: {1}.", data[0], data[1]) }
                }
            }
        };

    public virtual bool SendEmailVerificationCode(string emailTo, string userName, string verificationCode)
    {
        string message = MessagesLanguageMap[LanguageCode][I18nEmailMessagesTags.EmailVerificationCode](new List<string>() { userName, emailTo, verificationCode });

        return EmailMsgSender.SendEmail(new EmailContent() { Body = message, EmailTo = emailTo, From = EmailFrom, Subject = I18nTranslationDep.Translation(I18nTags.PleaseConfirmYourXerionAccountRegistration) });
    }

    public virtual bool SendPasswordResetVerificationCode(string emailTo, string userName, string verificationCode)
    {
        string message = MessagesLanguageMap[LanguageCode][I18nEmailMessagesTags.PasswordResetEmailVerificationCode](new List<string>() { userName, verificationCode });

        return EmailMsgSender.SendEmail(new EmailContent() { Body = message, EmailTo = emailTo, From = EmailFrom, Subject = I18nTranslationDep.Translation(I18nTags.PleaseConfirmYourXerionAccountRegistration) });
    }
}