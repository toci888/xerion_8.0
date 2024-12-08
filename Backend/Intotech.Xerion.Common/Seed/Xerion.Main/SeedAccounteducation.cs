using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Main;

public class SeedAccounteducation : SeedXerionMainLogic<Accounteducation>
{
    public override void Insert()
    {
        List<Accounteducation> list = new List<Accounteducation>();

        list.Add(new Accounteducation() { Idaccount = 1, Idprofession = 1, Iduniversityname = 1, Idprofessionaltitle = 1, Datestart = DateTime.Now.AddDays(-30), Professionaltitle= "inż", Professionname= "Informatyka", Universityname= "Uniwersytet im. Adama Mickiewicza" });
        list.Add(new Accounteducation() { Idaccount = 1, Idprofession = 2, Iduniversityname = 2, Idprofessionaltitle = 2, Datestart = DateTime.Now.AddDays(-30), Professionaltitle = "mgr", Professionname = "Informatyka", Universityname = "Uniwersytet im. Adama Mickiewicza" });

        InsertCollection(list);
    }
}