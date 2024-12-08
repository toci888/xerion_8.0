using Intotech.Xerion.Database.Persistence.Models;
using System.Linq.Expressions;

namespace Intotech.Xerion.Common.Seed.Xerion.Main
{
    public class SeedPushtoken : SeedXerionMainLogic<Pushtoken>
    {
        public override void Insert()
        {
            List<Pushtoken> list = new List<Pushtoken>();

            //TODO Here !

            InsertCollection(list);
        }
    }
}