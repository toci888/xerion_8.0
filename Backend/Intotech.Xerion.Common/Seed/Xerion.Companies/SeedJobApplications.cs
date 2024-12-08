using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Companies
{
    public class SeedJobApplications : SeedXerionCompaniesLogic<Jobapplication>
    {
        public override void Insert()
        {
            List<Jobapplication> list = new List<Jobapplication>
            {
                new () { Idjobadvertisements = 1, Idaccount = 1, Name = ""}
            };

            InsertCollection(list);
        }
    }
}
