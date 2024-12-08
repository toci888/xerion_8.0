using Intotech.Xerion.Bll.Models.Quizzes;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.ModelMappers.Quizzes;

public static class QuizzesMapper
{
    public static QuizzesAnswerDto Map(Quizzesanswer quizzesanswer)
    {
        return new QuizzesAnswerDto()
        {
            Idquiz = quizzesanswer.Idquiz,
            Id = quizzesanswer.Id,
            Answer = quizzesanswer.Answer,
            Idquestion = quizzesanswer.Idquestion,
            Image = quizzesanswer.Image,
            Additionaltext = quizzesanswer.Additionaltext,
            Totalscore = quizzesanswer.Totalscore,
            Totaltime = quizzesanswer.Totaltime
        };
    }

    public static QuizzesQuestionDto Map(Quizzesquestion quizzesanswer)
    {
        return new QuizzesQuestionDto()
        {
            Idquiz = quizzesanswer.Idquiz,
            Id = quizzesanswer.Id,
            Image = quizzesanswer.Image,
            Totalscore = quizzesanswer.Totalscore,
            Type = quizzesanswer.Type,
            Additionaltext = quizzesanswer.Additionaltext,
            Question = quizzesanswer.Question,
            Totaltime = quizzesanswer.Totaltime,
        };
    }
}