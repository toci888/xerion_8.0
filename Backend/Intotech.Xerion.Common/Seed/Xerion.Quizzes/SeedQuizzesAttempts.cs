using Intotech.Xerion.Bll.Models.Enums;
using Intotech.Xerion.Common.Seed.Xerion.Companies;
using Intotech.Xerion.Companies.Database.Persistence.Models;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Quizzes;

public class SeedQuizzesAttempts : SeedXerionQuizzesLogic<Quizzesattempt>
{
    public override void Insert()
    {
        List<Quizzesattempt> list = new List<Quizzesattempt>
        {
            new() { Totalelapsedtime = "02:34", Totalparticipantscore = 9, Idaccount = 1, Idquiz = 1 },
        };

        InsertCollection(list);
    }
}