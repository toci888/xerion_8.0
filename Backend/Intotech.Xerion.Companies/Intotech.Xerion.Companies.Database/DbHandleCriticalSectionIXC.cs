using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Database;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Companies.Database
{
    public class DbHandleCriticalSectionIXC<TModel> : DbHandleCriticalSection<TModel> where TModel : ModelBase
    {
        public DbHandleCriticalSectionIXC() : base(new IntotechXerionCompaniesContext(), "Host=localhost;Database=Intotech.Xerion;Username=postgres;Password=beatka")
        {
        }

    }
}