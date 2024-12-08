using Intotech.Common.Bll.Seed;
using Intotech.Xerion.Database.Persistence.Models;
using Intotech.Xerion.Database;
using Microsoft.EntityFrameworkCore;
using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Common.Seed.Xerion.Dictionaries
{
    public abstract class SeedXerionDictionariesLogic<TModel> : SeedBase<TModel> where TModel : ModelBase
    {
        protected int AccountIdOffset = 1000000000;
        protected List<TModel> ModelsEntities = new List<TModel>();

        public SeedXerionDictionariesLogic()
        {
            DbHandle = new DbHandleCriticalSectionIX<TModel>();
        }
        protected override DbContext GetEfHandle()
        {
            return new IntotechXerionContext();
        }
    }
}