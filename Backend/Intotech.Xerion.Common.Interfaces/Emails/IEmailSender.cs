using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Common.Interfaces.Emails;

public interface IEmailSender
{
    bool SendEmail(EmailContent content);
}