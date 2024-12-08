using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Database;
using Intotech.Common;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;

namespace Intotech.Xerion.Dictionaries.Database
{
    public class DbHandleCriticalSectionIXD<TModel> : DbHandleCriticalSection<TModel> where TModel : ModelBase
    {
        public DbHandleCriticalSectionIXD() : base(new IntotechXerionDictionariesContext(), new ErrorLoggerDefault())
        {
        }
    }
}