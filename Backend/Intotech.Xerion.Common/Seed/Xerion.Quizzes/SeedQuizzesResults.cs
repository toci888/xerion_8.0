using Intotech.Xerion.Bll.Models.Enums;
using Intotech.Xerion.Common.Seed.Xerion.Companies;
using Intotech.Xerion.Companies.Database.Persistence.Models;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Quizzes;

public class SeedQuizzesResults : SeedXerionQuizzesLogic<Quizzesresult>
{
    public override void Insert()
    {
        List<Quizzesresult> list = new List<Quizzesresult>
        {
            new () { Idaccount = 1, Score = 2, Idquizzesanswer = 1, Elapsedtime = "03:24", Idquiz = 1, Answer = "Tak", Idquizzesattempt = 1},
        };

        InsertCollection(list);
    }
}