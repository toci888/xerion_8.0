using Intotech.Xerion.Bll.Manager.Interfaces;
using Intotech.Xerion.Dictionaries.Bll.Persistence.Interfaces;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Manager
{
    public class ProfessionsManager : IProfessionsManager
    {
        protected IProfessionsLogic ProfessionsLogic;

        public ProfessionsManager(IProfessionsLogic professionsLogic)
        {
            ProfessionsLogic = professionsLogic;
        }

        public void AcceptLanguageHeader(string header)
        {

        }

        public virtual List<Profession> GetDictionaryItems(string filter)
        {
            return ProfessionsLogic.Select(m => m.Name.ToLower().StartsWith(filter)).ToList();
        }
    }
}