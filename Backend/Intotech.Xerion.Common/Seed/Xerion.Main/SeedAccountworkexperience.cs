using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Main;

public class SeedAccountworkexperience : SeedXerionMainLogic<Accountworkexperience>
{
    public override void Insert()
    {
        List<Accountworkexperience> list = new List<Accountworkexperience>
        {
            new Accountworkexperience() { Idaccount = 1, Idprofession = 1, Idworkcompany = 1, Datestart = DateTime.Now.AddDays(-8), Workcompany="ENEA", Profession = "Web Developer" },
            new Accountworkexperience() { Idaccount = 1, Idprofession = 1, Idworkcompany = 1, Datestart = DateTime.Now.AddDays(-50), Dateend = DateTime.Now.AddDays(-10), Workcompany="UPS" }
        };

        InsertCollection(list);
    }
}