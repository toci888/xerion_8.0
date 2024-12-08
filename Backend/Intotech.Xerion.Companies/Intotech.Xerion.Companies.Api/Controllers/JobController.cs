using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Intotech.Xerion.Bll.Models.Companies;
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
    public class JobController : XerionApiSimpleControllerBase<IJobService>
    {
        public JobController(IJobService manager, IHttpContextAccessor httpContextAccessor) : base(manager, httpContextAccessor)
        { }

        [HttpPost("create")]
        public ReturnedResponse<JobRegisterDto> Register(JobRegisterDto job)
        {
            ReturnedResponse<JobRegisterDto> reg = Manager.Register(job);

            return reg;
        }

        [HttpGet("get-job-by-id")]
        public ReturnedResponse<GetJobCompleteDto> GetJobById(int id)
        {
            return Manager.GetJobById(id);
        }


        [HttpGet("get-jobs-by-idaccount")]
        public ReturnedResponse<List<GetJobCompleteDto>> GetJobsByIdAccount(int id)
        {
            return Manager.GetJobsByIdAccount(id);
        }

        [HttpGet("get-jobs")]
        public ReturnedResponse<List<GetJobsQuickInfoDto>> GetJobs(string? phrase, string? location, int? count)
        {
            return Manager.GetJobs(phrase, location, count);
        }

        //[Authorize(Roles = "User")]
        [HttpGet("get-jobs-by-idCompany")]
        public ReturnedResponse<List<JobAdvertisementDto>> GetJobsByIdCompany(int idCompany)
        {
            return Manager.GetJobsByIdCompany(idCompany);
        }

        //[Authorize(Roles = "User")]
        [HttpPatch("update-job-by-id")]
        public ReturnedResponse<JobCompleteDto> UpdateJobById([FromBody] JobCompleteDto job)
        {
            return Manager.UpdateJob(job);
        }

        //[Authorize(Roles = "User")]
        [HttpDelete("delete-job-by-id")]
        public ReturnedResponse<int> DeleteJobById(int jobId)
        {
            return Manager.DeleteJob(jobId);
        }
    }
}
