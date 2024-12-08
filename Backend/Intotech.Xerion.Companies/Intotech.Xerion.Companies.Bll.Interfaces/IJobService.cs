using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Intotech.Xerion.Bll.Models.Companies;
using Intotech.Xerion.Companies.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Companies.Database.Persistence.Models;

namespace Intotech.Xerion.Companies.Bll.Interfaces
{
    public interface IJobService : IManager
    {
        ReturnedResponse<JobRegisterDto> Register(JobRegisterDto job);
        ReturnedResponse<List<GetJobsQuickInfoDto>> GetJobs(string? phrase, string? location, int? count);
        ReturnedResponse<GetJobCompleteDto> GetJobById(int id);
        ReturnedResponse<List<GetJobCompleteDto>> GetJobsByIdAccount(int idAccount);
        ReturnedResponse<List<JobAdvertisementDto>> GetJobsByIdCompany(int id);
        ReturnedResponse<JobCompleteDto> UpdateJob(JobCompleteDto updatedJob);
        ReturnedResponse<int> DeleteJob(int jobId);
    }
}