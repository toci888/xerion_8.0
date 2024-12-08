using Intotech.Xerion.Bll.Models.Enums;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Companies;

public class SeedCompanysocialmedialink : SeedXerionCompaniesLogic<Companysocialmedialink>
{
    public override void Insert()
    {
        List<Companysocialmedialink> list = new List<Companysocialmedialink>
        {
            new () { Idcompany = 1, Name = "Facebook", Link = "https://www.facebook.com/", Idsocialmedialink = (int) SocialMediaLinksEnum.Facebook},
            new () { Idcompany = 1, Name = "Twitter", Link = "https://twitter.com/?lang=pl", Idsocialmedialink = (int) SocialMediaLinksEnum.Twitter},
            new () { Idcompany = 1, Name = "LinkedIn", Link = "https://pl.linkedin.com/", Idsocialmedialink = (int) SocialMediaLinksEnum.LinkedIn},
            new () { Idcompany = 1, Name = "Instagram", Link = "https://www.instagram.com/", Idsocialmedialink = (int)SocialMediaLinksEnum.Instagram},
        };

        InsertCollection(list);
    }
}