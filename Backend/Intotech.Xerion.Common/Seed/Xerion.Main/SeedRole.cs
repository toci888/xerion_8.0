using Intotech.Xerion.Database.Persistence.Models;
using System.Linq.Expressions;

namespace Intotech.Xerion.Common.Seed.Xerion.Main
{
    public class SeedRole : SeedXerionMainLogic<Role>
    {
        public override void Insert()
        {
            List<Role> list = new List<Role>();
            
            list.Add(new Role() { Name = "User" });
            list.Add(new Role() { Name = "Admin" });

            InsertCollection(list);
        }

        public override Expression<Func<Role, bool>> TakeWhereCondition(Role searchValue)
        {
            return m => m.Name == searchValue.Name;
        }
    }
}