using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Main;

public class SeedAccountsoftskillstitle : SeedXerionMainLogic<Accountsoftskillstitle>
{
    public override void Insert()
    {
        List<string> titles = new List<string>()
        {
            "Organizacje i stowarzyszenia",
            "Umiejętności miękkie",
            "Hobby"
        };

        List<Accountsoftskillstitle> list = titles.Select(title => new Accountsoftskillstitle() { Name = title }).ToList();

        InsertCollection(list);
    }
}