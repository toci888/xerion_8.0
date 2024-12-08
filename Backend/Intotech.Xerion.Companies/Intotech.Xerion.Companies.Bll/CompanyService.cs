using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Intotech.Common.Interfaces;
using Intotech.Xerion.Bll.Models.Companies;
using Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;
using Intotech.Xerion.Bll.Persistence.Http;
using Intotech.Xerion.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Common;
using Intotech.Xerion.Common.I18n;
using Intotech.Xerion.Common.Interfaces;
using Intotech.Xerion.Common.Logging;
using Intotech.Xerion.Companies.Bll.Interfaces;
using Intotech.Xerion.Companies.Bll.Persistence.Interfaces;
using Intotech.Xerion.Companies.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Companies.Bll
{
    public class CompanyService : LoggerServiceBase, ICompanyService
    {
        protected ICompanyLogic CompanyLogic;
        protected ICompanyImageLogic CompanyImageLogic;
        protected ICompanyTechnologyLogic CompanyTechnologyLogic;
        protected ICompanySocialMediaLinkLogic CompanySocialMediaLinkLogic;
        protected ICompanyOfficeLogic CompanyOfficeLogic;
        protected IJobLogic JobLogic;
        protected IJobService JobService;


        public CompanyService(ITranslationEngineI18n i18nTranslation,
            ICompanyLogic companyLogic,
            ICompanyImageLogic companyImageLogic,
            ICompanyTechnologyLogic companyTechnologyLogic,
            ICompanySocialMediaLinkLogic companySocialMediaLinkLogic,
            ICompanyOfficeLogic companyOfficeLogic,
            IJobLogic jobLogic,
            IJobService jobService
            ) : base(i18nTranslation)
        {
            CompanyLogic = companyLogic;
            CompanyImageLogic = companyImageLogic;
            CompanyTechnologyLogic = companyTechnologyLogic;
            CompanySocialMediaLinkLogic = companySocialMediaLinkLogic;
            CompanyOfficeLogic = companyOfficeLogic;
            JobLogic = jobLogic;
            JobService = jobService;
            //AccountCompaniesViewLogic = accountCompaniesViewLogic;
        }

        public ReturnedResponse<CompanyRegisterDto> Register(CompanyRegisterDto companyDto)
        {
            XerionHttpClientProxy client = new XerionHttpClientProxy();
            //ReturnedResponse<AccountCompleteDto> response = client.ApiAccountGet(companyDto.IdAccount);

            Company company = new Company()
            {
                Idaccount = companyDto.IdAccount,
                Headquarteraddress = companyDto.HeadquarterAddress,
                Name = companyDto.Name,
                Nip = companyDto.Nip,
            };

            Company newCompany = CompanyLogic.Insert(company);

            companyDto.Id = newCompany.Id;

            if (companyDto.Id == 0)
            {
                return new ReturnedResponse<CompanyRegisterDto>(null, I18nTranslationDep.Translation(I18nTags.Error), false, ErrorCodes.NoData);
            }

            return new ReturnedResponse<CompanyRegisterDto>(companyDto, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public virtual ReturnedResponse<GetCompanyCompleteDto> GetCompanyById(int companyId)
        {
            Company? company = CompanyLogic.Select(m => m.Id == companyId).FirstOrDefault();
            List<Companysocialmedialink> companySocialMediaLinks = CompanySocialMediaLinkLogic.Select(m => m.Idcompany == companyId).ToList();
            List<Companyimage> companyImages = CompanyImageLogic.Select(m => m.Idcompany == companyId).ToList();
            List<Companyoffice> companyOffices = CompanyOfficeLogic.Select(m => m.Idcompany == companyId).ToList();
            List<Companytechnology> companyTechnologies = CompanyTechnologyLogic.Select(m => m.Idcompany == companyId).ToList();

            if (company == null)
            {
                return new ReturnedResponse<GetCompanyCompleteDto>(null, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
            }

            CompanyModelDto companyModelDto = new CompanyModelDto()
            {
                Description = company.Description,
                Employeecount = company.Employeecount,
                Headquarteraddress = company.Headquarteraddress,
                Idaccount = company.Idaccount,
                Logo = company.Logo,
                Name = company.Name,
                Nip = company.Nip,
                //Companyestablishment = company.Companyestablishment,
            };

            GetCompanyCompleteDto companyComplete = new GetCompanyCompleteDto()
            {
                Company = companyModelDto,
                CompanySocialMediaLinks = companySocialMediaLinks,
                CompanyImages = companyImages,
                CompanyOffices = companyOffices,
                CompanyTechnologies = companyTechnologies
            };

            return new ReturnedResponse<GetCompanyCompleteDto>(companyComplete, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public virtual ReturnedResponse<List<Company>> GetCompanies(int idAccount)
        {
            List<Company> company = CompanyLogic.Select(m => m.Idaccount == idAccount).ToList();

            return new ReturnedResponse<List<Company>>(company, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public virtual ReturnedResponse<int> DeleteCompanyById(int id)
        {
            var jobs = JobLogic.Select(x => x.Companyid == id).ToList();
            foreach (var job in jobs)
            {
                JobService.DeleteJob(job.Id);
            }

            int result = 0;
            result += CompanyImageLogic.Delete(x => x.Idcompany == id);
            result += CompanyTechnologyLogic.Delete(x => x.Idcompany == id);
            result += CompanySocialMediaLinkLogic.Delete(x => x.Idcompany == id);
            result += CompanyOfficeLogic.Delete(x => x.Idcompany == id);
            result += CompanyLogic.Delete(m => m.Id == id);

            if (result == 0)
            {
                return new ReturnedResponse<int>(0, I18nTranslationDep.Translation(I18nTags.Error), false, ErrorCodes.AccountNotFound);
            }

            return new ReturnedResponse<int>(result, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public virtual ReturnedResponse<CompanyCompleteDto> UpdateCompany(CompanyCompleteDto company)
        {
            if (company.Company == null)
            {
                return new ReturnedResponse<CompanyCompleteDto>(null, I18nTranslationDep.Translation(I18nTags.AccountNotFound), false, ErrorCodes.AccountNotFound);
            }

            List<Companysocialmedialink> socialMediaCollection = new List<Companysocialmedialink>();
            if (company.CompanySocialMediaLinks == null || company.CompanySocialMediaLinks.Count() == 0)
            {
                socialMediaCollection = CompanySocialMediaLinkLogic.Select(x => company.Company.Id == x.Idcompany).ToList();
            }
            else
            {
                socialMediaCollection = CompanySocialMediaLinkLogic.Select(x => company.CompanySocialMediaLinks[0].Idcompany == x.Idcompany).ToList();
            }
            socialMediaCollection.ForEach(item => CompanySocialMediaLinkLogic.Delete(item));
            foreach (var socialMediaLink in company.CompanySocialMediaLinks)
            {
                Companysocialmedialink companysocialmedialink = new Companysocialmedialink()
                {
                    Idcompany = socialMediaLink.Idcompany,
                    Idsocialmedialink = socialMediaLink.Idsocialmedialink,
                    Link = socialMediaLink.Link,
                    Name = socialMediaLink.Name,
                };

                CompanySocialMediaLinkLogic.Insert(companysocialmedialink);
            }

            List<Companyimage> imagesCollection = new List<Companyimage>();
            if (company.CompanyImages == null || company.CompanyImages.Count() == 0)
            {
                imagesCollection = CompanyImageLogic.Select(x => company.Company.Id == x.Idcompany).ToList();
            }
            else
            {
                imagesCollection = CompanyImageLogic.Select(x => company.CompanyImages[0].Idcompany == x.Idcompany).ToList();
            }
            imagesCollection.ForEach(item => CompanyImageLogic.Delete(item));
            foreach (var image in company.CompanyImages)
            {
                Companyimage companyimage = new Companyimage()
                {
                    Idcompany = image.Idcompany,
                    Name = image.Name,
                    Image = image.Image
                };

                CompanyImageLogic.Update(companyimage);
            }

            List<Companyoffice> officesCollection = new List<Companyoffice>();
            if (company.CompanyOffices == null || company.CompanyOffices.Count() == 0)
            {
                officesCollection = CompanyOfficeLogic.Select(x => company.Company.Id == x.Idcompany).ToList();
            }
            else
            {
                officesCollection = CompanyOfficeLogic.Select(x => company.CompanyOffices[0].Idcompany == x.Idcompany).ToList();
            }
            officesCollection.ForEach(item => CompanyOfficeLogic.Delete(item));
            foreach (var office in company.CompanyOffices)
            {
                Companyoffice companyoffice = new Companyoffice()
                {
                    Idcompany = office.Idcompany,
                    Iframeurl = office.Iframeurl,
                    Location = office.Location,
                };

                CompanyOfficeLogic.Update(companyoffice);
            }

            List<Companytechnology> companytechnologies = new List<Companytechnology>();
            if (company.CompanyTechnologies == null || company.CompanyTechnologies.Count() == 0)
            {
                companytechnologies = CompanyTechnologyLogic.Select(x => company.Company.Id == x.Idcompany).ToList();
            }
            else
            {
                companytechnologies = CompanyTechnologyLogic.Select(x => company.CompanyTechnologies[0].Idcompany == x.Idcompany).ToList();
            }
            companytechnologies.ForEach(item => CompanyTechnologyLogic.Delete(item));
            foreach (var technology in company.CompanyTechnologies)
            {
                Companytechnology companytechnology = new Companytechnology()
                {
                    Idcompany = technology.Idcompany,
                    Idtechnology = technology.Idtechnology,
                    Name = technology.Name
                };

                CompanyTechnologyLogic.Update(companytechnology);
            }

            var companyestablishment = company.Company.Companyestablishment != null ? XerionUtils.ParseDateTime(company.Company.Companyestablishment.Value) : company.Company.Companyestablishment;
            Company companyModelDto = new Company()
            {
                Id = company.Company.Id,
                Description = company.Company.Description,
                Employeecount = company.Company.Employeecount,
                Headquarteraddress = company.Company.Headquarteraddress,
                Idaccount = company.Company.Idaccount,
                Logo = company.Company.Logo,
                Name = company.Company.Name,
                Nip = company.Company.Nip,
                Companyestablishment = companyestablishment
            };

            Company? updatedCompany = CompanyLogic.Update(companyModelDto);

            return new ReturnedResponse<CompanyCompleteDto>(company, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }
    }
}