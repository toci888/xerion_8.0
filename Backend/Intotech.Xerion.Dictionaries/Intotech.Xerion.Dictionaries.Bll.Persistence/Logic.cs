using Intotech.Common.Bll;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Dictionaries.Database;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;
using Microsoft.EntityFrameworkCore;

namespace Intotech.Xerion.Dictionaries.Bll.Persistence;

public class Logic<TModel> : LogicBase<TModel> where TModel : ModelBase
{
    public Logic()
    {
        DbHandle = new DbHandleCriticalSectionIXD<TModel>();
    }
    protected override DbContext GetEfHandle()
    {
        return new IntotechXerionDictionariesContext();
    }
}