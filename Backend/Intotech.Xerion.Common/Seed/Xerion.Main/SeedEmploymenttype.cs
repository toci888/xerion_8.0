using Intotech.Xerion.Database.Persistence.Models;
using System.Linq.Expressions;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Main
{
    public class SeedEmploymenttype : SeedXerionMainLogic<Employmenttype>
    {
        public override void Insert()
        {
            List<Employmenttype> list = new List<Employmenttype>();

            //TODO Here !

            InsertCollection(list);
        }

        public override Expression<Func<Employmenttype, bool>> TakeWhereCondition(Employmenttype searchValue)
        {
            return m => m.Name == searchValue.Name;
        }
    }
}