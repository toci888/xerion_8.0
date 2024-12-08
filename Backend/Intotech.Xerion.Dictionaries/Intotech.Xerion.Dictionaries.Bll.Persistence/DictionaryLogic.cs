using Intotech.Common.Bll.Dictionaries;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Dictionaries.Database;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;
using Microsoft.EntityFrameworkCore;

namespace Intotech.Xerion.Dictionaries.Bll.Persistence;

public class DictionaryLogic<TModel> : DictionaryLogicBase<TModel> where TModel : DictionaryModelBase
{
    public DictionaryLogic()
    {
        DbHandle = new DbHandleCriticalSectionIXD<TModel>();
    }
    protected override DbContext GetEfHandle()
    {
        return new IntotechXerionDictionariesContext();
    }
}