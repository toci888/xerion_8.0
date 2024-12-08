using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Intotech.Xerion.Bll.Models.Companies
{
    public class CompanyRegisterDto : ModelBase
    {
        public int IdAccount { get; set; }
        public string Name { get; set; }
        public string Nip { get; set; }
        public string HeadquarterAddress { get; set; }
    }
}
