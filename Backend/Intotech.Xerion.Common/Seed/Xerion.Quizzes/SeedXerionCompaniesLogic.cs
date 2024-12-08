using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Bll.Seed;
using Microsoft.EntityFrameworkCore;
using Intotech.Xerion.Companies.Database.Persistence.Models;
using Intotech.Xerion.Companies.Database;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;
using Intotech.Xerion.Quizzes.Database;

namespace Intotech.Xerion.Common.Seed.Xerion.Companies
{
    public abstract class SeedXerionQuizzesLogic<TModel> : SeedBase<TModel> where TModel : ModelBase
    {
        protected List<TModel> ModelsEntities = new List<TModel>();

        public SeedXerionQuizzesLogic()
        {
            DbHandle = new DbHandleCriticalSectionIXQ<TModel>();
        }
        protected override DbContext GetEfHandle()
        {
            return new IntotechXerionQuizzesContext();
        }
    }
}
