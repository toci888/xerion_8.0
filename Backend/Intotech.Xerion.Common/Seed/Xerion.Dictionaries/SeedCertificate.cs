using Intotech.Xerion.Common.Seed.Xerion.Main;
using Intotech.Xerion.Database.Persistence.Models;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;
using System.Linq.Expressions;

namespace Intotech.Xerion.Common.Seed.Xerion.Dictionaries;

public class SeedCertificate : SeedXerionMainLogic<Certificate>
{
    public override void Insert()
    {
        List<Certificate> list = new List<Certificate>();

        list.Add(new Certificate() { Name = "Azure Cert", Serialnumber = "ASD1BHKB", Obtainingdate = DateTime.Now.AddMonths(-1), Expirationdate = DateTime.Now.AddMonths(3)});

        InsertCollection(list);
    }

    public override Expression<Func<Certificate, bool>> TakeWhereCondition(Certificate searchValue)
    {
        return m => m.Name == searchValue.Name;
    }
}