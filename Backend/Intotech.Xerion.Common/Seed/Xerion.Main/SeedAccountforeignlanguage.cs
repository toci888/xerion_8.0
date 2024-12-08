using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Main;

public class SeedAccountforeignlanguage : SeedXerionMainLogic<Accountforeignlanguage>
{
    public override void Insert()
    {
        List<Accountforeignlanguage> list = new List<Accountforeignlanguage>();

        list.Add(new Accountforeignlanguage() { Idaccount = 1, Idforeignlanguage = 1, Level = 1});

        InsertCollection(list);
    }
}