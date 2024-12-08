using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Intotech.Xerion.Bll.Models.Companies;
using Intotech.Xerion.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Common;
using Intotech.Xerion.Companies.Bll.Interfaces;
using Intotech.Xerion.Companies.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Companies.Database.Persistence.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Intotech.Xerion.Companies.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompanyController : XerionApiSimpleControllerBase<ICompanyService>
    {
        public CompanyController(ICompanyService manager, IHttpContextAccessor httpContextAccessor) : base(manager, httpContextAccessor)
        { }

        //[Authorize(Roles = "User")]
        [HttpPost("create")]
        public ReturnedResponse<CompanyRegisterDto> Register(CompanyRegisterDto company)
        {
            ReturnedResponse<CompanyRegisterDto> reg = Manager.Register(company);

            return reg;
        }

        //[Authorize(Roles = "User")]
        [HttpGet("get-company-by-id")]
        public ReturnedResponse<GetCompanyCompleteDto> GetCompanyById(int id)
        {
            return Manager.GetCompanyById(id);
        }

        //[Authorize(Roles = "User")]
        [HttpGet("get-companies-by-idAccount")]
        public ReturnedResponse<List<Company>> GetCompaniesByIdAccount(int id)
        {
            return Manager.GetCompanies(id);
        }

        //[Authorize(Roles = "User")]
        [HttpPatch("update-company-by-id")]
        public ReturnedResponse<CompanyCompleteDto> UpdateCompanyById([FromBody] CompanyCompleteDto company)
        {
            return Manager.UpdateCompany(company);
        }

        //[Authorize(Roles = "User")]
        [HttpDelete("delete-company-by-id")]
        public ReturnedResponse<int> DeleteCompanyById(int id)
        {
            return Manager.DeleteCompanyById(id);
        }
    }
}
