using Intotech.Xerion.Bll.Models.Enums;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Main;

public class SeedAccountsocialmedialink : SeedXerionMainLogic<Accountsocialmedialink>
{
    public override void Insert()
    {
        List<Accountsocialmedialink> list = new List<Accountsocialmedialink>
        {
            new () { Name = "LinkedIn", Idsocialmedialink = (int)SocialMediaLinksEnum.LinkedIn, Link = "https://pl.linkedin.com/", Idaccount = 1 },
            new () { Name = "GitHub", Idsocialmedialink = (int)SocialMediaLinksEnum.GitHub, Link = "https://github.com/", Idaccount = 1 }
        };

        InsertCollection(list);
    }
}