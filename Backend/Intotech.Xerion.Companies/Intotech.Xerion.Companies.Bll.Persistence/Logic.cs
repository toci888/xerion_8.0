using Intotech.Common.Bll;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Companies.Database.Persistence.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Intotech.Xerion.Companies.Bll.Persistence
{
    public class Logic<TModel> : LogicBase<TModel> where TModel : ModelBase
    {
        public Logic() : base() { }
        protected override DbContext GetEfHandle()
        {
            return new IntotechXerionCompaniesContext();
        }
    }
}
