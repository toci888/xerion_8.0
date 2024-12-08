using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Manager.Interfaces
{
    public interface IProfessionsManager : IManager
    {
        List<Profession> GetDictionaryItems(string filter);
    }
}