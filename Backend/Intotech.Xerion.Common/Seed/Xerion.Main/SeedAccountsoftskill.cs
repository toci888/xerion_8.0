using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Main;

public class SeedAccountsoftskill : SeedXerionMainLogic<Accountsoftskill>
{
    public override void Insert()
    {
        List<Accountsoftskill> list = new List<Accountsoftskill>
        {
            new Accountsoftskill() { Idaccountsoftskillstitle = 1, Idaccount = 1, Name = "starosta roku" }, // TODO enums
            new Accountsoftskill() { Idaccountsoftskillstitle = 1, Idaccount = 1, Name = "wolontariusz w schronisku dla zwierząt" },
            new Accountsoftskill() { Idaccountsoftskillstitle = 2, Idaccount = 1, Name = "praca w zespole" },
            new Accountsoftskill() { Idaccountsoftskillstitle = 2, Idaccount = 1, Name = "samodzielność" },
            new Accountsoftskill() { Idaccountsoftskillstitle = 2, Idaccount = 1, Name = "sumienność" },
            new Accountsoftskill() { Idaccountsoftskillstitle = 2, Idaccount = 1, Name = "dokładność" },
            new Accountsoftskill() { Idaccountsoftskillstitle = 3, Idaccount = 1, Name = "siłownia" },
            new Accountsoftskill() { Idaccountsoftskillstitle = 3, Idaccount = 1, Name = "malowanie" },
            new Accountsoftskill() { Idaccountsoftskillstitle = 3, Idaccount = 1, Name = "tynkowanie" }
        };

        InsertCollection(list);
    }
}