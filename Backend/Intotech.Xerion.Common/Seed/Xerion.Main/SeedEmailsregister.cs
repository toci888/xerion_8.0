using Intotech.Xerion.Database.Persistence.Models;
using System.Linq.Expressions;

namespace Intotech.Xerion.Common.Seed.Xerion.Main
{
    public class SeedEmailsregister : SeedXerionMainLogic<Emailsregister>
    {
        public override void Insert()
        {
            List<Emailsregister> list = new List<Emailsregister>();

            //TODO Here !

            InsertCollection(list);
        }

        public override Expression<Func<Emailsregister, bool>> TakeWhereCondition(Emailsregister searchValue)
        {
            return m => m.Email == searchValue.Email;
        }
    }
}