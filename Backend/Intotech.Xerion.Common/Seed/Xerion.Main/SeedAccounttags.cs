using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Main;

public class SeedAccounttags : SeedXerionMainLogic<Accounttag>
{
    public override void Insert()
    {
        List<Accounttag> list = new List<Accounttag>()
        {
            new Accounttag() { Idtag = 1, Info = ".Net Lover", Idaccount = 1 },
            new Accounttag() { Idtag = 1, Info = "React Newbie", Idaccount = 1 }
        };

        InsertCollection(list);
    }
}