using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Main;

public class SeedAccountworkresponsibility : SeedXerionMainLogic<Accountworkresponsibility>
{
    public override void Insert()
    {
        List<Accountworkresponsibility> list = new List<Accountworkresponsibility>();

        list.Add(new Accountworkresponsibility() { Idaccount = 1, Name = "Projektowanie bazy danych", Idaccountworkexperience = 1 });
        list.Add(new Accountworkresponsibility() { Idaccount = 1, Name = "Implementacja nowych funkcjonalności", Idaccountworkexperience = 1 });

        InsertCollection(list);
    }
}