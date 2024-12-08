using Intotech.Xerion.Database.Persistence.Models;
using System.Linq.Expressions;

namespace Intotech.Xerion.Common.Seed.Xerion.Main
{
    public class SeedFailedloginattempt : SeedXerionMainLogic<Failedloginattempt>
    {
        public override void Insert()
        {
            List<Failedloginattempt> list = new List<Failedloginattempt>();

            //TODO Here !

            InsertCollection(list);
        }
    }
}