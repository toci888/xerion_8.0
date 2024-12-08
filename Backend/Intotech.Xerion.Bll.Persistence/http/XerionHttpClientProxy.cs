using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Intotech.Common.Http;
using Intotech.Xerion.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Persistence.Http
{
    public class XerionHttpClientProxy : HttpClientProxy
    {
        public XerionHttpClientProxy()
        {
            BaseUrl = "http://localhost:5010/";
        }

        public virtual ReturnedResponse<Company> ApiRegisterCompany(Company company)
             => ApiPost<ReturnedResponse<Company>, Company>($"api/Company/register", company, false);

        public virtual ReturnedResponse<AccountCompleteDto> ApiAccountGet(int idAccount) 
            => ApiGet<ReturnedResponse<AccountCompleteDto>>($"api/Account/get-account-by-id?id={idAccount}", false);
    }
}
