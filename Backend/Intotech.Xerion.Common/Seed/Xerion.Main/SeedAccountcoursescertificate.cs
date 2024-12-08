using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Main;

public class SeedAccountcoursescertificate : SeedXerionMainLogic<Accountcoursescertificate>
{
    public override void Insert()
    {
        List<Accountcoursescertificate> list = new List<Accountcoursescertificate>();

        list.Add(new Accountcoursescertificate() {Idaccount = 1, Idcertificate = 1, Certificatenumber = "asd", Idorganizationissuingcertificate = 1, Certificateissuedate = DateTime.Now, Certificatename="Murarz", Organizationissuingcertificate="Udemy"});
        list.Add(new Accountcoursescertificate() {Idaccount = 1, Idcertificate = 1, Certificatenumber = "zxc", Idorganizationissuingcertificate = 1, Certificateissuedate = DateTime.Now, Certificatename = "Tynkarz", Organizationissuingcertificate = "Udemy" });
        
        InsertCollection(list);
    }
}