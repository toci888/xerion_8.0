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
    public class SeedJobDetails : SeedXerionCompaniesLogic<Jobdetail>
    {
        private string[] mainWorks = new[]
        {
            "Programowanie modułów systemu i pisanie testów systemowych (unit tests)\nProjektowanie i dokumentowanie komponentów i funkcji systemu\nWspieranie continuous integration i wdrożenia\nWspieranie utrzymania systemu (naprawianie błędów)",
            "Projektowanie i dokumentowanie komponentów i funkcji systemu",
        };

        private string[] mainFeatures = new[]
        {
            "Umiejętność pozytywnej współpracy",
            "Krytyczne myślenie",
        };

        public override void Insert()
        {
            List<Jobdetail> list = new List<Jobdetail>
            {
                new () { Name = mainWorks[0], Iddetail = (int)JobDetailsEnum.MainResponsibilities, Idjobadvertisements = 1 },
                new () { Name = mainWorks[1], Iddetail = (int)JobDetailsEnum.MainResponsibilities, Idjobadvertisements = 1 },

                new () { Name = mainFeatures[0], Iddetail = (int)JobDetailsEnum.CandidateValues, Idjobadvertisements = 1 },
                new () { Name = mainFeatures[1], Iddetail = (int)JobDetailsEnum.CandidateValues, Idjobadvertisements = 1 },

                new () { Name = "scrum", Iddetail = (int)JobDetailsEnum.WorkOrganization, Idjobadvertisements = 1 },
                new () { Name = "agile", Iddetail = (int)JobDetailsEnum.WorkOrganization, Idjobadvertisements = 1 },
                new () { Name = "jira", Iddetail = (int)JobDetailsEnum.WorkOrganization, Idjobadvertisements = 1 },

                new () { Name = "Multisport", Iddetail = (int)JobDetailsEnum.Benefits, Idjobadvertisements = 1 },
                new () { Name = "Dofinansowanie zajęć sportowych", Iddetail = (int)JobDetailsEnum.Benefits, Idjobadvertisements = 1 },
                new () { Name = "Spotkania integracyjne", Iddetail = (int)JobDetailsEnum.Benefits, Idjobadvertisements = 1 },
                new () { Name = "Elastyczny czas pracy", Iddetail = (int)JobDetailsEnum.Benefits, Idjobadvertisements = 1 },

                new () { Name = "Laptop", Iddetail = (int)JobDetailsEnum.ProvidedTools, Idjobadvertisements = 1 },
                new () { Name = "Dodatkowy monitor", Iddetail = (int)JobDetailsEnum.ProvidedTools, Idjobadvertisements = 1 },
                new () { Name = "Słuchawki", Iddetail = (int)JobDetailsEnum.ProvidedTools, Idjobadvertisements = 1 },
                new () { Name = "Telefon służbowy", Iddetail = (int)JobDetailsEnum.ProvidedTools, Idjobadvertisements = 1 },

                new () { Name = "Software house", Iddetail = (int)JobDetailsEnum.AdditionalInfo, Idjobadvertisements = 1 },
                new () { Name = "Zagraniczni klienci", Iddetail = (int)JobDetailsEnum.AdditionalInfo, Idjobadvertisements = 1 },
                new () { Name = "Masz wpływ na to, co dzieje się w firmie", Iddetail = (int)JobDetailsEnum.AdditionalInfo, Idjobadvertisements = 1 },
                new () { Name = "Tworzysz kod od zera", Iddetail = (int)JobDetailsEnum.AdditionalInfo, Idjobadvertisements = 1 },
            };

            InsertCollection(list);
        }
    }
}
