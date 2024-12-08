using Intotech.Common.Database.DbSetup;
using Intotech.Xerion.Common.Seed.Xerion.Main;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Dictionaries
{
    public class XerionDictionariesSeedManager
    {
        public virtual void SeedAllDb()
        {
            //SeedManager seedManager = new SeedManager();
            //seedManager.SeedProfessions("SQL/Data/Professions.txt");
            //seedManager.SeedLanguagesAndFrameworks("SQL/Data/languagesAndFrameworks.txt");

            new ProfessionsParser().Insert();
            new LanguagesAndFrameworksParser().Insert();
            //new SeedEmploymenttypes().Insert();
        }
    }
}
