using Intotech.Xerion.Common.Seed.Xerion.Main;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Intotech.Xerion.Common.Seed.Xerion.Companies
{
    public class XerionCompaniesSeedManager
    {
        public virtual void SeedAllDb()
        {
            new SeedCompanies().Insert();
            new SeedCompanyTechnologies().Insert();
            new SeedCompanyImages().Insert();
            new SeedCompanyOffices().Insert();
            new SeedCompanysocialmedialink().Insert();
            new SeedJobAdvertisements().Insert();
            new SeedJobTechnologies().Insert();
            new SeedJobDetails().Insert();
            new SeedJobApplications().Insert();
        }
    }
}
