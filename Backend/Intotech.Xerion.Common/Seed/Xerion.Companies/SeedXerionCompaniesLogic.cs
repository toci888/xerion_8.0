using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Bll.Seed;
using Microsoft.EntityFrameworkCore;
using Intotech.Xerion.Companies.Database.Persistence.Models;
using Intotech.Xerion.Companies.Database;

namespace Intotech.Xerion.Common.Seed.Xerion.Companies
{
    public abstract class SeedXerionCompaniesLogic<TModel> : SeedBase<TModel> where TModel : ModelBase
    {
        protected List<TModel> ModelsEntities = new List<TModel>();

        public SeedXerionCompaniesLogic()
        {
            DbHandle = new DbHandleCriticalSectionIXC<TModel>();
        }
        protected override DbContext GetEfHandle()
        {
            return new IntotechXerionCompaniesContext();
        }
    }
}
