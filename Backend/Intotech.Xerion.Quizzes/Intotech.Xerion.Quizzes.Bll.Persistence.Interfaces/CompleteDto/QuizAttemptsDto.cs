using Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;
using Intotech.Xerion.Bll.Models.ModelDtos.Quizzes.Dtos;
using Intotech.Xerion.Bll.Models.Quizzes;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Quizzes.Bll.Persistence.Interfaces.CompleteDto;

public class QuizAttemptsDto
{
    public Quiz Quiz { get; set; }

    public AccountModelDto Account { get; set; }

    public Quizzesattempt QuizAttempt { get; set; }
}