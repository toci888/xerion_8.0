using Intotech.Xerion.Dictionaries.Bll.Persistence;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace Intotech.Xerion.Common.Seed.Xerion.Dictionaries
{
    public class ProfessionsParser : SeedLogicDict<Profession>
    {
        protected FileParser FileParser = new();

        public override void Insert()
        {
            string sqlDataFilePath = "SQL/Data/Professions.txt";
            
            List<Profession> professions = FileParser.ParseProfessions(sqlDataFilePath);

            InsertCollection(professions);
        }
    }
}
