using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Bll.Seed;
using Intotech.Common.Database;
using Intotech.Common.Tests;
using Intotech.Xerion.Database;
using Intotech.Xerion.Database.Persistence.Models;
using Microsoft.EntityFrameworkCore;

namespace Intotech.Xerion.Common.Seed.Xerion.Main;

public abstract class SeedXerionMainLogic<TModel> : SeedBase<TModel> where TModel : ModelBase
{
    protected int AccountIdOffset = 1000000000;
    protected List<TModel> ModelsEntities = new List<TModel>();

    public SeedXerionMainLogic()
    {
        DbHandle = new DbHandleCriticalSectionIX<TModel>();
    }
    protected override DbContext GetEfHandle()
    {
        return new IntotechXerionContext();
    }
}