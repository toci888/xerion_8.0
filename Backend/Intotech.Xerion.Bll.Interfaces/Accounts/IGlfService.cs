namespace Intotech.Xerion.Bll.Interfaces.Accounts;

public interface IGlfService<TTokenContent> where TTokenContent : class
{
    TTokenContent GetUserByToken(string token);
}