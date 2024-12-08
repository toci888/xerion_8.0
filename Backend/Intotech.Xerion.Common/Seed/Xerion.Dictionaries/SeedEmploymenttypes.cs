using Intotech.Xerion.Common.Seed.Xerion.Main;
using Intotech.Xerion.Database.Persistence.Models;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;
using System.Linq.Expressions;

namespace Intotech.Xerion.Common.Seed.Xerion.Dictionaries;

public class SeedEmploymenttypes : SeedXerionMainLogic<Employmenttype>
{
    public override void Insert()
    {
        List<Employmenttype> list = new List<Employmenttype>();

        list.Add(new Employmenttype() { Name = "Umowa o prace" });
        list.Add(new Employmenttype() { Name = "Umowa o dzieło" });
        list.Add(new Employmenttype() { Name = "Umowa zlecenie" });

        InsertCollection(list);
    }

    public override Expression<Func<Employmenttype, bool>> TakeWhereCondition(Employmenttype searchValue)
    {
        return m => m.Name == searchValue.Name;
    }
}