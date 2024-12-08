using Intotech.Xerion.Bll.Models.ModelDtos.Quizzes.Dtos;
using Intotech.Xerion.Bll.Models.Quizzes;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Quizzes.Bll.Persistence.Interfaces.CompleteDto;

public class QuizUpdateCompleteDto
{
    public QuizModelDto Quiz { get; set; } 
    public List<QuizzesAnswerUpdateDto> QuizzesAnswers { get; set; }
    public List<QuizzesQuestionUpdateDto> QuizzesQuestions { get; set; }
}