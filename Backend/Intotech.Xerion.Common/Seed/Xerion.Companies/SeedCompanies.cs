using Intotech.Xerion.Companies.Database.Persistence.Models;
using Intotech.Xerion.Database.Persistence.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Intotech.Xerion.Common.Seed.Xerion.Companies
{
    public class SeedCompanies : SeedXerionCompaniesLogic<Company>
    {
        List<string> descriptions = new List<string>()
        {
            "Cześć, tu T-Mobile!\nJesteśmy firmą technologiczną, a naszym celem jest tworzenie innowacyjnych rozwiązań dla klientów indywidualnych i biznesowych. Jako jedni z pierwszych udostępniliśmy na rynku sieć 5G, oferujemy najlepszej jakości usługi mobilne, a dzięki kilkunastu Data Center zapewniamy całe spektrum usług ICT. Oferujemy wiele usług z zakresu rozwiązań chmurowych oraz cyber bezpieczeństwa.\nW T-Mobile wszyscy żyjemy w świecie magenta! Kolor ten jest nam bliski, bo oznacza wiarę w powodzenie podejmowanych działań, pewność siebie i wytrzymałość. Właśnie tacy jesteśmy jako zespół. W #MagentaTeam stawiamy na wymianę doświadczeń, zwinną pracę i szybko adaptujemy się do zmian!"
        };

        private List<string> logos = new List<string>()
        {
            "data:image/png;base64,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"
        };

        public override void Insert()
        {
            List<Company> list = new List<Company>
            {
                new () { Nip = "12345123", Name = "Inea", Headquarteraddress = "Warszawa", Idaccount = 1, Description = descriptions[0], Logo = logos[0], Employeecount = 553 },
                new () { Nip = "12344444", Name = "Capgemini", Headquarteraddress = "Poznań", Idaccount = 1, Description = descriptions[0], Logo = logos[0], Employeecount = 264 }
            };

            InsertCollection(list);
        }
    }
}
