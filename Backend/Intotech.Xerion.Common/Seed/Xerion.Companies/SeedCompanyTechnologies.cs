using Intotech.Xerion.Bll.Models.Enums;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Companies;

public class SeedCompanyTechnologies : SeedXerionCompaniesLogic<Companytechnology>
{
    public override void Insert()
    {
        List<Companytechnology> list = new List<Companytechnology>
        {
            // Technologies
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Technologies, Name = "html", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Technologies, Name = "css", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Technologies, Name = "angularjs", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Technologies, Name = "cplus", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Technologies, Name = "java", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Technologies, Name = "python", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Technologies, Name = "js", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Technologies, Name = "typescript", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Technologies, Name = "androidstudio", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Technologies, Name = "react", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Technologies, Name = "react", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Technologies, Name = "csharp", Idcompany = 1 },

            // Tools
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Tools, Name = "jenkins", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Tools, Name = "git", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Tools, Name = "jira", Idcompany = 1 },

            // Tools
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Platforms, Name = "windows", Idcompany = 1 },
            new () { Idtechnology = (int)CompanyTechnologiesEnum.Platforms, Name = "linux", Idcompany = 1 },
        };

        InsertCollection(list);
    }
}