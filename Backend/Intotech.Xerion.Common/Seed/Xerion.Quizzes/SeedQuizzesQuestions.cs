using Intotech.Xerion.Bll.Models.Enums;
using Intotech.Xerion.Common.Seed.Xerion.Companies;
using Intotech.Xerion.Companies.Database.Persistence.Models;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Quizzes;

public class SeedQuizzesQuestions : SeedXerionQuizzesLogic<Quizzesquestion>
{
    public override void Insert()
    {
        List<Quizzesquestion> list = new List<Quizzesquestion>
        {
            new () { Idquiz = 1, Totalscore = 2, Question = "Czy .Net jest najlepszy?", Type = (int)QuizzesTypesEnum.SingleChoiceQuestion, Totaltime = "00:20", Additionaltext = "Oczywiście, że tak :)"},
            new () { Idquiz = 1, Totalscore = 2, Question = "Czy Java jest obiektowa?", Type = (int)QuizzesTypesEnum.SingleChoiceQuestion },
            new () { Idquiz = 1, Totalscore = 2, Question = "Czy TypeScript jest obiektowy?", Type = (int)QuizzesTypesEnum.SingleChoiceQuestion },
            new () { Idquiz = 1, Totalscore = 2, Question = "Czy .Net jest obiektowy?", Type = (int)QuizzesTypesEnum.MultipleChoiceQuestion },
            new () { Idquiz = 1, Totalscore = 2, Question = "Czy .Net jest funkcyjny?", Type = (int)QuizzesTypesEnum.MultipleChoiceQuestion },
            new () { Idquiz = 1, Totalscore = 2, Question = "Czy #fff to biały?", Type = (int)QuizzesTypesEnum.MultipleChoiceQuestion },
        };

        InsertCollection(list);
    }
}