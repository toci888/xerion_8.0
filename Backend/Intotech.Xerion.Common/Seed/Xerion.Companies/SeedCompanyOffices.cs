using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Companies;

public class SeedCompanyOffices : SeedXerionCompaniesLogic<Companyoffice>
{
    private List<string> iframes = new List<string>()
    {
        { $"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d156388.803116818!2d21.061194099999998!3d52.23293795!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x471ecc669a869f01%3A0x72f0be2a88ead3fc!2sWarszawa!5e0!3m2!1spl!2spl!4v1701884284964!5m2!1spl!2spl\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade" },
        { $"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d155797.37316875526!2d16.736861401132302!3d52.400623458159885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x470444d2ece10ab7%3A0xa4ea31980334bfd1!2zUG96bmHFhA!5e0!3m2!1spl!2spl!4v1701884328075!5m2!1spl!2spl\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"" },
    };

    public override void Insert()
    {
        List<Companyoffice> list = new List<Companyoffice>
        {
            new () { Idcompany = 1, Location = "Warszawa", Iframeurl = iframes[0] },
            new () { Idcompany = 1, Location = "Warszawa", Iframeurl = iframes[1] },
        };

        InsertCollection(list);
    }
}