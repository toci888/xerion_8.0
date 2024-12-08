using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Bll.Seed;
using Intotech.Xerion.Dictionaries.Database;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;
using Microsoft.EntityFrameworkCore;

namespace Intotech.Xerion.Common.Seed.Xerion.Dictionaries
{
    public abstract class SeedLogicDict<TModel> : SeedBase<TModel> where TModel : ModelBase
    {
        protected int AccountIdOffset = 1000000000;
        protected List<TModel> ModelsEntities = new List<TModel>();

        public SeedLogicDict()
        {
            DbHandle = new DbHandleCriticalSectionIXD<TModel>();
        }

        protected override DbContext GetEfHandle()
        {
            return new IntotechXerionDictionariesContext();
        }
    }
}