using Intotech.Xerion.Common.Seed.Xerion.Main;
using Intotech.Xerion.Database.Persistence.Models;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;
using System.Linq.Expressions;

namespace Intotech.Xerion.Common.Seed.Xerion.Dictionaries;

public class SeedWorkschedule : SeedXerionMainLogic<Workschedule>
{
    public override void Insert()
    {
        List<Workschedule> list = new List<Workschedule>();

        list.Add(new Workschedule() { Name = "Pełen etat" });
        list.Add(new Workschedule() { Name = "Pół etatu" });
        list.Add(new Workschedule() { Name = "Ćwierć etatu" });

        InsertCollection(list);
    }

    public override Expression<Func<Workschedule, bool>> TakeWhereCondition(Workschedule searchValue)
    {
        return m => m.Name == searchValue.Name;
    }
}