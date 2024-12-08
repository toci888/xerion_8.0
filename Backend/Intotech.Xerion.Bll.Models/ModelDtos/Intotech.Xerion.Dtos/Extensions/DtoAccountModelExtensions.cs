using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos.Extensions
{
    public static class DtoAccountModelExtensions
    {
        public static List<TModelDto> SupplyAccountId<TModelDto>(this List<TModelDto> modelsCollection, int accountId)
            where TModelDto : DtoAccountModelBase
        {
            for (int i = 0; i < modelsCollection.Count(); i++)
            {
                modelsCollection[i].Idaccount = accountId;
            }

            return modelsCollection;
        }
    }
}
