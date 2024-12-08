using Intotech.Common.Bll;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Database.Persistence.Models;
using Microsoft.EntityFrameworkCore;

namespace Intotech.Xerion.Bll.Persistence;

public class Logic<TModel> : LogicBase<TModel> where TModel : ModelBase
{
    public Logic() : base() { }
    protected override DbContext GetEfHandle()
    {
        return new IntotechXerionContext();
    }
}