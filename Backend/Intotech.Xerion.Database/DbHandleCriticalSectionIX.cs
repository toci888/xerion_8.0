using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Database;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Database
{
    public class DbHandleCriticalSectionIX<TModel> : DbHandleCriticalSection<TModel> where TModel : ModelBase
    {
        public DbHandleCriticalSectionIX() : base(new IntotechXerionContext(), "Host=localhost;Database=Intotech.Xerion;Username=postgres;Password=beatka")
        {
        }
    }
}