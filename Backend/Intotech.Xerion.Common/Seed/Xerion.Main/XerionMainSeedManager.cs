using Intotech.Common.Database.DbSetup;
using Intotech.Xerion.Database.Persistence.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Intotech.Xerion.Common.Seed.Xerion.Main
{
    public class XerionMainSeedManager
    { 
        public virtual void SeedAllDb()
        {
            new SeedRole().Insert();
            new SeedAccount().Insert();
            new SeedAccountsocialmedialink().Insert();
            new SeedAccounttechnicalskill().Insert();
            new SeedAccounttags().Insert();
            new SeedAccountsoftskillstitle().Insert();
            new SeedAccountsoftskill().Insert();
            new SeedAccountcoursescertificate().Insert();
            new SeedAccounteducation().Insert();
            new SeedAccountforeignlanguage().Insert();
            new SeedAccountworkexperience().Insert();
            new SeedAccountworkresponsibility().Insert();
        }
    }
}
