using Intotech.Xerion.Companies.Database.Persistence.Models;
using Intotech.Xerion.Database.Persistence.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Enyim.Caching.Memcached.Protocol;
using static System.Net.Mime.MediaTypeNames;
using System.Xml.Linq;
using Intotech.Xerion.Bll.Models.Enums;

namespace Intotech.Xerion.Common.Seed.Xerion.Companies
{
    public class SeedJobAdvertisements : SeedXerionCompaniesLogic<Jobadvertisement>
    {
        public override void Insert()
        {
            List<Jobadvertisement> list = new List<Jobadvertisement>
            {
                new Jobadvertisement
                {
                    Name = "Developer",
                    Publicid = "ABC123",
                    Image = "",
                    Description = "I am a programmer",
                    Employmentmethod = (int)EmploymentMethodsEnum.FullTime,
                    Employmenttype = (int)EmploymentTypesEnum.EmploymentContract,
                    Expirationdate = DateTime.Now.AddMonths(1),
                    Companyid = 1,
                    Salarymin = 1000,
                    Salarymax = 15000,
                    Quizid = 1
                },
                new Jobadvertisement
                {
                    Name = "Front End Developer",
                    Publicid = "ABC124",
                    Image = "",
                    Description = "I am a Front End Developer",
                    Employmentmethod = (int)EmploymentMethodsEnum.FullTime,
                    Employmenttype = (int)EmploymentTypesEnum.FixedTermEmploymentContract,
                    Expirationdate = DateTime.Now.AddMonths(1),
                    Companyid = 1,
                    Salarymin = 1000,
                    Salarymax = 15000,
                    Quizid = 1
                },
                new Jobadvertisement
                {
                    Name = "Backend Developer",
                    Publicid = "ABC125",
                    Image = "",
                    Description = "I am a Backend Developer",
                    Employmentmethod = (int)EmploymentMethodsEnum.PartTime,
                    Employmenttype = (int)EmploymentTypesEnum.PartTimeEmploymentContract,
                    Expirationdate = DateTime.Now.AddMonths(2),
                    Companyid = 1,
                    Salarymin = 2000,
                    Salarymax = 12000,
                    Quizid = 1
                },
                new Jobadvertisement
                {
                    Name = "Mobile App Developer",
                    Publicid = "ABC126",
                    Image = "",
                    Description = "I am a Mobile App Developer",
                    Employmentmethod = (int)EmploymentMethodsEnum.B2B,
                    Employmenttype = (int)EmploymentTypesEnum.ContractForSpecificTask,
                    Expirationdate = DateTime.Now.AddMonths(1),
                    Companyid = 2,
                    Salarymin = 1500,
                    Salarymax = 18000,
                    Quizid = 1
                },
                new Jobadvertisement
                {
                    Name = "Software Engineer",
                    Publicid = "ABC127",
                    Image = "",
                    Description = "I am a Software Engineer",
                    Employmentmethod = (int)EmploymentMethodsEnum.FixedTermContract,
                    Employmenttype = (int)EmploymentTypesEnum.ServiceContract,
                    Expirationdate = DateTime.Now.AddMonths(2),
                    Companyid = 2,
                    Salarymin = 2500,
                    Salarymax = 20000,
                    Quizid = 1
                }

            };

            InsertCollection(list);
        }
    }
}
