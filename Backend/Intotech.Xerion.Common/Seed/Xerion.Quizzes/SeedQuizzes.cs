using Intotech.Xerion.Bll.Models.Enums;
using Intotech.Xerion.Common.Seed.Xerion.Companies;
using Intotech.Xerion.Companies.Database.Persistence.Models;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Quizzes;

public class SeedQuizzes : SeedXerionQuizzesLogic<Quiz>
{
    public override void Insert()
    {
        List<Quiz> list = new List<Quiz>
        {
            new () { Name = "ASP.NET", Description = "Sprawdź się w .NET!", Totalscore = 10, Totaltime = "5:00", Idcompany = 1, Type = (int)QuizzesTypesEnum.SingleChoiceQuestion, Technology = ".Net", Passingthreshold = 80 }
        };

        InsertCollection(list);
    }
}