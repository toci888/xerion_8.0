using Intotech.Xerion.Companies.Database.Persistence.Models;
using Intotech.Xerion.Database.Persistence.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Enyim.Caching.Memcached.Protocol;
using static System.Net.Mime.MediaTypeNames;
using System.Xml.Linq;
using Intotech.Xerion.Bll.Models.Enums;

namespace Intotech.Xerion.Common.Seed.Xerion.Companies
{
    public class SeedJobTechnologies : SeedXerionCompaniesLogic<Jobtechnology>
    {
        public override void Insert()
        {
            List<Jobtechnology> list = new List<Jobtechnology>
            {
                new () {Icon = "html", Description = "Poczatkujacy", Idtechnology = (int)JobTechnologiesEnum.Technologies, Idjobadvertisements = 1 },
                new () {Icon = "js", Description = "Sredni", Idtechnology = (int)JobTechnologiesEnum.Technologies, Idjobadvertisements = 1 },
                new () {Icon = "c#", Description = "Poczatkujacy", Idtechnology = (int)JobTechnologiesEnum.Technologies, Idjobadvertisements = 1 },

                new () {Icon = "git", Description = "Mile widziany", Idtechnology = (int)JobTechnologiesEnum.Tools, Idjobadvertisements = 1 },
                new () {Icon = "jira", Description = "obowiazkowy", Idtechnology = (int)JobTechnologiesEnum.Tools, Idjobadvertisements = 1 },

                new () {Icon = "windows", Description = "Mile widziany", Idtechnology = (int)JobTechnologiesEnum.Platforms, Idjobadvertisements = 1 },
                new () {Icon = "linux", Description = "obowiazkowy", Idtechnology = (int)JobTechnologiesEnum.Platforms, Idjobadvertisements = 1 },

                new () {Icon = "Polski", Description = "zaawansowany (C1)", Idtechnology = (int)JobTechnologiesEnum.Languages, Idjobadvertisements = 1 },
                new () {Icon = "Angielski", Description = "wyższy średnio zaawansowany (B2)", Idtechnology = (int)JobTechnologiesEnum.Languages, Idjobadvertisements = 1 },
            };

            InsertCollection(list);
        }
    }
}
