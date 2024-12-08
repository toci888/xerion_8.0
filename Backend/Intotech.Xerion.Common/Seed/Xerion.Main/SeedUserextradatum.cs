using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Main
{
    public class SeedUserextradatum : SeedXerionMainLogic<Userextradatum>
    {
        public override void Insert()
        {
            List<Userextradatum> list = new List<Userextradatum>();

            //TODO Here !

            InsertCollection(list);
        }
    }
}