using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Intotech.Xerion.Bll.Models.Companies;
using Intotech.Xerion.Companies.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Companies.Bll.Interfaces
{
    public interface ICompanyService : IManager
    {
        ReturnedResponse<CompanyRegisterDto> Register(CompanyRegisterDto company);
        ReturnedResponse<GetCompanyCompleteDto> GetCompanyById(int companyId);
        ReturnedResponse<List<Company>> GetCompanies(int idAccount);
        ReturnedResponse<CompanyCompleteDto> UpdateCompany(CompanyCompleteDto prevCompany);
        ReturnedResponse<int> DeleteCompanyById(int id);
    }
}