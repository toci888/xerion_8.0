using Intotech.Xerion.Database.Persistence.Models;
using System.Linq.Expressions;

namespace Intotech.Xerion.Common.Seed.Xerion.Main
{
    public class SeedResetpassword : SeedXerionMainLogic<Resetpassword>
    {
        public override void Insert()
        {
            List<Resetpassword> list = new List<Resetpassword>();

            //TODO Here !

            InsertCollection(list);
        }
    }
}