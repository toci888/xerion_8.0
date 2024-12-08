using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Microsoft.AspNetCore.Mvc;
using Intotech.Xerion.Common;
using Intotech.Xerion.Bll.Models.Quizzes;
using Intotech.Xerion.Quizzes.Bll.Interfaces;
using Intotech.Xerion.Quizzes.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Quizzes.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class QuizzesController : XerionApiSimpleControllerBase<IQuizService>
    {
        public QuizzesController(IQuizService manager, IHttpContextAccessor httpContextAccessor) : base(manager, httpContextAccessor)
        { }

        //[Authorize(Roles = "User")]
        [HttpPost("create")]
        public ReturnedResponse<QuizRegisterDto> Create(QuizRegisterDto quiz)
        {
            ReturnedResponse<QuizRegisterDto> reg = Manager.Create(quiz);

            return reg;
        }

        [HttpPost("create-for-job-advertisement")]
        public ReturnedResponse<QuizRegisterDto> CreateForJobAdvertisement([FromQuery]int idJobAdvertisement, QuizRegisterDto quiz)
        {
            ReturnedResponse<QuizRegisterDto> reg = Manager.CreateForJob(idJobAdvertisement, quiz);

            return reg;
        }

        //[Authorize(Roles = "User")]
        [HttpGet("get-complete-quiz-by-id")]
        public ReturnedResponse<GetQuizCompleteDto> GetCompleteQuizById(int id)
        {
            return Manager.GetCompleteQuizById(id);
        }

        [HttpGet("get-quiz-by-idJobAdvertisement")]
        public ReturnedResponse<GetQuizDto> GetQuizByIdJobAdvertisement(int idJobAdvertisement)
        {
            return Manager.GetQuizByJobAdvertisement(idJobAdvertisement);
        }

        //[Authorize(Roles = "User")]
        [HttpGet("get-quizzes-by-idCompany")]
        public ReturnedResponse<List<Quiz>> GetQuizzesByIdCompany(int id)
        {
            return Manager.GetQuizzes(id);
        }

        //[Authorize(Roles = "User")]
        [HttpPatch("update-quiz-by-id")]
        public ReturnedResponse<QuizUpdateCompleteDto> UpdateQuizById([FromBody] QuizUpdateCompleteDto quiz)
        {
            return Manager.UpdateQuiz(quiz);
        }

        //[HttpPatch("participate-to-quiz")]
        //public ReturnedResponse<QuizCompleteDto> ParticipateToQuiz([FromBody] QuizCompleteDto quiz)
        //{
        //    return Manager.GetCompleteQuizById(quiz);
        //}

        [HttpPost("send-results")]
        public ReturnedResponse<int> SendResults([FromBody] List<QuizzesResultDto> quizzes)
        {
            return Manager.SendResults(quizzes);
        }

        [HttpGet("get-results")]
        public ReturnedResponse<QuizResultDto> GetResults(int quizAttemptId, int idAccount)
        {
            return Manager.GetResults(quizAttemptId, idAccount);
        }

        [HttpGet("get-all-results-for-job-advertisements")]
        public ReturnedResponse<List<QuizAttemptsDto>> GetAllResultsForJobAdvertisements(int jobOfferId)
        {
            return Manager.GetAllResultsForJobAdvertisements(jobOfferId);
        }

        //[Authorize(Roles = "User")]
        [HttpDelete("delete-quiz-by-id")]
        public ReturnedResponse<int> DeleteQuizById(int id)
        {
            return Manager.DeleteQuizById(id);
        }
    }
}
