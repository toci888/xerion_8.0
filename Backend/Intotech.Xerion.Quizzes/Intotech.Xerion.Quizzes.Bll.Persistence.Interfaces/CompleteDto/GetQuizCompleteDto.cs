using Intotech.Xerion.Bll.Models.ModelDtos.Quizzes.Dtos;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Quizzes.Bll.Persistence.Interfaces.CompleteDto;

public class GetQuizCompleteDto
{
    public QuizModelDto Quiz { get; set; } 
    public List<Quizzesanswer> QuizzesAnswer { get; set; }
    public List<Quizzesquestion> QuizzesQuestions { get; set; }
    public List<Quizzesresult> QuizzesResults { get; set; }
}