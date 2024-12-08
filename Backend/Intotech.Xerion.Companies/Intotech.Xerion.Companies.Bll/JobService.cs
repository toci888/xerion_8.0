using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Intotech.Common.Interfaces;
using Intotech.Xerion.Bll.Models.Companies;
using Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;
using Intotech.Xerion.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Common;
using Intotech.Xerion.Common.I18n;
using Intotech.Xerion.Common.Interfaces;
using Intotech.Xerion.Common.Logging;
using Intotech.Xerion.Companies.Bll.Interfaces;
using Intotech.Xerion.Companies.Bll.Persistence.Interfaces;
using Intotech.Xerion.Companies.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Companies.Database.Persistence.Models;
using Intotech.Xerion.Quizzes.Bll.Persistence.Interfaces;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;
using System.ComponentModel.Design;
using System.Linq.Expressions;

namespace Intotech.Xerion.Companies.Bll
{
    public class JobService : LoggerServiceBase, IJobService
    {
        protected ICompanyLogic CompanyLogic;
        protected IJobCompaniesViewsLogic JobCompaniesLogic;
        protected IJobLogic JobLogic;
        protected IJobTechnologiesLogic JobTechnologiesLogic;
        protected IJobDetailsLogic JobDetailsLogic;
        protected IJobApplicationsLogic JobApplicationsLogic;
        protected IQuizLogic QuizLogic;

        public JobService(ITranslationEngineI18n i18nTranslation,
            IJobLogic jobLogic,
            IJobTechnologiesLogic jobTechnologies,
            IJobDetailsLogic jobDetails,
            IJobApplicationsLogic jobApplications,
            IJobCompaniesViewsLogic jobCompaniesLogic,
            ICompanyLogic companyLogic,
            IQuizLogic quizLogic
                ) : base(i18nTranslation)
        {
            JobLogic = jobLogic;
            JobTechnologiesLogic = jobTechnologies;
            JobDetailsLogic = jobDetails;
            JobApplicationsLogic = jobApplications;
            CompanyLogic = companyLogic;
            JobCompaniesLogic = jobCompaniesLogic;
            QuizLogic = quizLogic;
        }

        public ReturnedResponse<JobRegisterDto> Register(JobRegisterDto jobDto)
        {
            if (jobDto.Job == null)
            {
                return new ReturnedResponse<JobRegisterDto>(null, I18nTranslationDep.Translation(I18nTags.AccountNotFound), false, ErrorCodes.AccountNotFound);
            }

            var expirationdate = jobDto.Job.Expirationdate != null ? XerionUtils.ParseDateTime(jobDto.Job.Expirationdate.Value) : jobDto.Job.Expirationdate;
            Jobadvertisement job = new Jobadvertisement()
            {
                Name = jobDto.Job.Name,
                Publicid = jobDto.Job.Publicid,
                Image = jobDto.Job.Image,
                Description = jobDto.Job.Description,
                Employmentmethod = jobDto.Job.Employmentmethod,
                Employmenttype = jobDto.Job.Employmenttype,
                Expirationdate = expirationdate,
                Companyid = jobDto.Job.Companyid,
                Salarymax = jobDto.Job.Salarymax,
                Salarymin = jobDto.Job.Salarymin,
                Quizid = jobDto.Job.Quizid,
            };

            Jobadvertisement newJob = JobLogic.Insert(job);

            jobDto.Id = newJob.Id;

            if (newJob.Id == 0)
            {
                return new ReturnedResponse<JobRegisterDto>(null, I18nTranslationDep.Translation(I18nTags.Error), false, ErrorCodes.NoData);
            }

            foreach (var technology in jobDto.JobTechnologies)
            {
                Jobtechnology jobTechnology = new Jobtechnology()
                {
                    Idtechnology = technology.Idtechnology,
                    Description = technology.Description,
                    Idjobadvertisements = newJob.Id,
                    Icon = technology.Icon
                };

                JobTechnologiesLogic.Update(jobTechnology);
            }

            foreach (var detail in jobDto.JobDetails)
            {
                Jobdetail jobDetail = new Jobdetail()
                {
                    Name = detail.Name,
                    Idjobadvertisements = newJob.Id,
                    Iddetail = detail.Iddetail,
                };

                JobDetailsLogic.Update(jobDetail);
            }

            return new ReturnedResponse<JobRegisterDto>(jobDto, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public virtual ReturnedResponse<GetJobCompleteDto> GetJobById(int jobId)
        {
            Jobadvertisement? job = JobLogic.Select(m => m.Id == jobId).FirstOrDefault();
            List<Jobtechnology> jobTechnologies = JobTechnologiesLogic.Select(m => m.Idjobadvertisements == jobId).ToList();
            List<Jobdetail> jobDetails = JobDetailsLogic.Select(m => m.Idjobadvertisements == jobId).ToList();

            if (job == null)
            {
                return new ReturnedResponse<GetJobCompleteDto>(null, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
            }

            var expirationdate = job.Expirationdate != null ? XerionUtils.ParseDateTime(job.Expirationdate.Value) : job.Expirationdate;
            JobModelDto jobModelDto = new JobModelDto()
            {
                Name = job.Name,
                Publicid = job.Publicid,
                Image = job.Image,
                Description = job.Description,
                Employmentmethod = job.Employmentmethod,
                Employmenttype = job.Employmenttype,
                Expirationdate = expirationdate,
                Companyid = job.Companyid,
                Id = job.Id,
                Quizid = job.Quizid,
            };

            GetJobCompleteDto getJobCompleteDto = new GetJobCompleteDto()
            {
                Job = jobModelDto,
                JobDetails = jobDetails,
                JobTechnologies = jobTechnologies
            };

            return new ReturnedResponse<GetJobCompleteDto>(getJobCompleteDto, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }
        
        public virtual ReturnedResponse<List<GetJobCompleteDto>> GetJobsByIdAccount(int idAccount)
        {
            var companies = CompanyLogic.Select(x => x.Idaccount == idAccount).ToList();

            var allJobs = new List<Jobadvertisement>();

            foreach (var company in companies)
            {
                var jobs = JobLogic.Select(x => x.Companyid == company.Id).ToList();

                foreach(var job in jobs)
                {
                    allJobs.Add(job);
                }
            }

            var results = new List<GetJobCompleteDto>();
            foreach (var job in allJobs)
            {
                List<Jobtechnology> jobTechnologies = JobTechnologiesLogic.Select(m => m.Idjobadvertisements == job.Id).ToList();
                List<Jobdetail> jobDetails = JobDetailsLogic.Select(m => m.Idjobadvertisements == job.Id).ToList();

                if (job == null)
                {
                    return new ReturnedResponse<List<GetJobCompleteDto>>(null, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
                }

                var expirationdate = job.Expirationdate != null ? XerionUtils.ParseDateTime(job.Expirationdate.Value) : job.Expirationdate;
                JobModelDto jobModelDto = new JobModelDto()
                {
                    Name = job.Name,
                    Publicid = job.Publicid,
                    Image = job.Image,
                    Description = job.Description,
                    Employmentmethod = job.Employmentmethod,
                    Employmenttype = job.Employmenttype,
                    Expirationdate = expirationdate,
                    Companyid = job.Companyid,
                    Id = job.Id,
                    Quizid = job.Quizid,
                };

                GetJobCompleteDto getJobCompleteDto = new GetJobCompleteDto()
                {
                    Job = jobModelDto,
                    JobDetails = jobDetails,
                    JobTechnologies = jobTechnologies
                };

                results.Add(getJobCompleteDto);
            }

            return new ReturnedResponse<List<GetJobCompleteDto>>(results, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public virtual ReturnedResponse<List<GetJobsQuickInfoDto>> GetJobs(string? phrase, string? location, int? count)
        {
            int quantity = count ?? 10;
            List<Jobcompaniesview> jobs;

            if (string.IsNullOrEmpty(phrase) && string.IsNullOrEmpty(location))
            {
                jobs = JobCompaniesLogic.Select(m => true).OrderBy(m => Guid.NewGuid()).Take(quantity).ToList();
            }
            else
            {
                Expression<Func<Jobcompaniesview, bool>> filterCondition = m =>
                    (string.IsNullOrEmpty(phrase) || m.Jobname.ToLower().Contains(phrase.ToLower()) || m.Jobdescription.ToLower().Contains(phrase.ToLower()))
                     && (string.IsNullOrEmpty(location) || m.Jobimage.ToLower().Contains(location.ToLower()));

                jobs = JobCompaniesLogic.Select(filterCondition).Take(quantity).ToList();
            }

            List<GetJobsQuickInfoDto> results = new List<GetJobsQuickInfoDto>();

            foreach (Jobcompaniesview job in jobs)
            {
                var jobtechnologies = JobTechnologiesLogic.Select(m => m.Idjobadvertisements == job.Id).ToList();

                var jobDto = new JobModelDto()
                {
                    Id = job.Id,
                    Name = job.Jobname,
                    Image = job.Jobimage,
                    Description = job.Jobdescription,
                    Employmentmethod = job.Jobemploymentmethod != null ? job.Jobemploymentmethod.Value : 0,
                    Employmenttype = job.Jobemploymenttype != null ? job.Jobemploymenttype.Value : 0,
                    Expirationdate = job.Jobexpirationdate != null ? job.Jobexpirationdate.Value : null,
                    Companyid = job.Companyid != null ? job.Companyid.Value : 0,
                    Quizid = job.Jobquizid != null ? job.Jobquizid.Value : 0
                };

                results.Add(new GetJobsQuickInfoDto()
                {
                    Job = jobDto,
                    Company = CompanyLogic.Select(m => m.Id == job.Companyid.Value).FirstOrDefault(),
                    JobTechnologies = jobtechnologies
                });
            }

            return new ReturnedResponse<List<GetJobsQuickInfoDto>>(results, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public virtual ReturnedResponse<List<JobAdvertisementDto>> GetJobsByIdCompany(int idCompany)
        {
            List<Jobadvertisement> jobs = JobLogic.Select(m => m.Companyid == idCompany).ToList();

            if (!jobs.Any())
            {
                return new ReturnedResponse<List<JobAdvertisementDto>>(null, I18nTranslationDep.Translation(I18nTags.NoData), false, ErrorCodes.NoData);
            }

            List<JobAdvertisementDto> results = new List<JobAdvertisementDto>();
            foreach (Jobadvertisement job in jobs)
            {
                var jobtechnologies = JobTechnologiesLogic.Select(m => m.Idjobadvertisements == job.Id).ToList();

                results.Add(new JobAdvertisementDto()
                {
                    Id = job.Id,
                    Name = job.Name,
                    Publicid = job.Publicid,
                    Image = job.Image,
                    Description = job.Description,
                    Employmentmethod = job.Employmentmethod,
                    Employmenttype = job.Employmenttype,
                    Expirationdate = job.Expirationdate,
                    Salarymin = job.Salarymin,
                    Salarymax = job.Salarymax,
                    Quizid = job.Quizid,
                    Companyid = job.Companyid,
                    Jobtechnologies = jobtechnologies
                });
            }

            return new ReturnedResponse<List<JobAdvertisementDto>>(results, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }


        public ReturnedResponse<JobCompleteDto> UpdateJob(JobCompleteDto updatedJob)
        {
            if (updatedJob.Job == null)
            {
                return new ReturnedResponse<JobCompleteDto>(null, I18nTranslationDep.Translation(I18nTags.AccountNotFound), false, ErrorCodes.AccountNotFound);
            }

            var expirationdate = updatedJob.Job.Expirationdate != null ? XerionUtils.ParseDateTime(updatedJob.Job.Expirationdate.Value) : updatedJob.Job.Expirationdate;
            Jobadvertisement jobAdvertisement = new Jobadvertisement()
            {
                Id = updatedJob.Job.Id,
                Name = updatedJob.Job.Name,
                Publicid = updatedJob.Job.Publicid,
                Image = updatedJob.Job.Image,
                Description = updatedJob.Job.Description,
                Employmentmethod = updatedJob.Job.Employmentmethod,
                Employmenttype = updatedJob.Job.Employmenttype,
                Expirationdate = expirationdate,
                Companyid = updatedJob.Job.Companyid,
                Salarymax = updatedJob.Job.Salarymax,
                Salarymin = updatedJob.Job.Salarymin,
                Quizid = updatedJob.Job.Quizid
            };

            List<Jobtechnology> technologiesCollection = new List<Jobtechnology>();
            if (updatedJob.JobTechnologies == null || updatedJob.JobTechnologies.Count() == 0)
            {
                technologiesCollection = JobTechnologiesLogic.Select(x => updatedJob.Job.Id == x.Id).ToList();
            }
            else
            {
                technologiesCollection = JobTechnologiesLogic.Select(x => updatedJob.JobTechnologies[0].Idjobadvertisements == x.Idjobadvertisements).ToList();
            }
            technologiesCollection.ForEach(item => JobTechnologiesLogic.Delete(item));
            foreach (var technology in updatedJob.JobTechnologies)
            {
                Jobtechnology jobTechnology = new Jobtechnology()
                {
                    Idtechnology = technology.Idtechnology,
                    Description = technology.Description,
                    Idjobadvertisements = technology.Idjobadvertisements,
                    Icon = technology.Icon,
                };

                JobTechnologiesLogic.Update(jobTechnology);
            }

            List<Jobdetail> detailsCollection = new List<Jobdetail>();
            if (updatedJob.JobDetails == null || updatedJob.JobDetails.Count() == 0)
            {
                detailsCollection = JobDetailsLogic.Select(x => updatedJob.Job.Id == x.Id).ToList();
            }
            else
            {
                detailsCollection = JobDetailsLogic.Select(x => updatedJob.JobDetails[0].Idjobadvertisements == x.Idjobadvertisements).ToList();
            }
            detailsCollection.ForEach(item => JobDetailsLogic.Delete(item));
            foreach (var detail in updatedJob.JobDetails)
            {
                Jobdetail jobDetail = new Jobdetail()
                {
                    Name = detail.Name,
                    Idjobadvertisements = detail.Idjobadvertisements,
                    Iddetail = detail.Iddetail,
                };

                JobDetailsLogic.Update(jobDetail);
            }

            Jobadvertisement? job = JobLogic.Update(jobAdvertisement);

            return new ReturnedResponse<JobCompleteDto>(updatedJob, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public ReturnedResponse<int> DeleteJob(int jobId)
        {
            int result = 0;
            result += JobTechnologiesLogic.Delete(x => x.Idjobadvertisements == jobId);
            result += JobDetailsLogic.Delete(x => x.Idjobadvertisements == jobId);
            result += JobApplicationsLogic.Delete(x => x.Idjobadvertisements == jobId);
            result += JobLogic.Delete(m => m.Id == jobId);

            if (result == 0)
            {
                return new ReturnedResponse<int>(0, I18nTranslationDep.Translation(I18nTags.Error), false, ErrorCodes.AccountNotFound);
            }

            return new ReturnedResponse<int>(result, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }
    }
}