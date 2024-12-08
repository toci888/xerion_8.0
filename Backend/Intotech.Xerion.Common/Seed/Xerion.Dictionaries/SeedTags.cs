using Intotech.Xerion.Database.Persistence.Models;
using System.Linq.Expressions;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;
using Intotech.Xerion.Common.Seed.Xerion.Main;

namespace Intotech.Xerion.Common.Seed.Xerion.Dictionaries;

public class SeedTags : SeedXerionMainLogic<Tag>
{
    public override void Insert() // to do xerion main?
    {
        List<Tag> list = new List<Tag>();

        list.Add(new Tag() { Name = "Java Lover" });
        list.Add(new Tag() { Name = "JS Newbie" });

        InsertCollection(list);
    }

    public override Expression<Func<Tag, bool>> TakeWhereCondition(Tag searchValue)
    {
        return m => m.Name == searchValue.Name;
    }
}