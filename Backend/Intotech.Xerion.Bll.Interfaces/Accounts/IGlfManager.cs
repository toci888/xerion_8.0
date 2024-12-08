using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Interfaces.Accounts;

public interface IGlfManager
{
    Accountrole RegisterByMethod(string method, string token);
}