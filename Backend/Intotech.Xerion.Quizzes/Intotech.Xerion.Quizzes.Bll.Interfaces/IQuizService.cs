using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Intotech.Xerion.Bll.Models.Quizzes;
using Intotech.Xerion.Quizzes.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;
using Microsoft.AspNetCore.Mvc;

namespace Intotech.Xerion.Quizzes.Bll.Interfaces
{
    public interface IQuizService : IManager
    {
        ReturnedResponse<QuizRegisterDto> Create(QuizRegisterDto quizDto);
        ReturnedResponse<GetQuizCompleteDto> GetCompleteQuizById(int quizId);
        ReturnedResponse<GetQuizDto> GetQuizByJobAdvertisement(int idJobAdvertisement);
        ReturnedResponse<List<Quiz>> GetQuizzes(int idAccount);
        ReturnedResponse<QuizUpdateCompleteDto> UpdateQuiz(QuizUpdateCompleteDto prevQuiz);
        ReturnedResponse<int> SendResults(List<QuizzesResultDto> quizzesResults);
        ReturnedResponse<QuizResultDto> GetResults(int quizAttemptId, int idAccount);
        ReturnedResponse<List<QuizAttemptsDto>> GetAllResultsForJobAdvertisements(int jobOfferId);
        ReturnedResponse<int> DeleteQuizById(int id);
        ReturnedResponse<QuizRegisterDto> CreateForJob(int idJobAdvertisement, QuizRegisterDto quizDto);
    }
}
