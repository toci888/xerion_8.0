using Intotech.Xerion.Bll.Models.Enums;
using Intotech.Xerion.Common.Seed.Xerion.Companies;
using Intotech.Xerion.Companies.Database.Persistence.Models;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Quizzes;

public class SeedQuizzesAnswers : SeedXerionQuizzesLogic<Quizzesanswer>
{
    public override void Insert()
    {
        List<Quizzesanswer> list = new List<Quizzesanswer>
        {
            new () { Idquiz = 1, Idquestion = 1, Answer = "Tak", Iscorrect = 1 },
            new () { Idquiz = 1, Idquestion = 1, Answer = "Nie", Iscorrect = 0 },
            new () { Idquiz = 1, Idquestion = 1, Answer = "Java", Iscorrect = 0 },
            new () { Idquiz = 1, Idquestion = 1, Answer = "Nie wiem", Iscorrect = 0 },

            new () { Idquiz = 1, Idquestion = 2, Answer = "Tak", Iscorrect = 0 },
            new () { Idquiz = 1, Idquestion = 2, Answer = "Nie", Iscorrect = 1 },
            new () { Idquiz = 1, Idquestion = 2, Answer = "Bóg", Iscorrect = 0 },
            new () { Idquiz = 1, Idquestion = 2, Answer = "Nie wiem", Iscorrect = 0 },

            new () { Idquiz = 1, Idquestion = 3, Answer = "Tak", Iscorrect = 0 },
            new () { Idquiz = 1, Idquestion = 3, Answer = "Nie", Iscorrect = 0 },
            new () { Idquiz = 1, Idquestion = 3, Answer = "Bóg", Iscorrect = 1 },
            new () { Idquiz = 1, Idquestion = 3, Answer = "Nie wiem", Iscorrect = 0 },

            new () { Idquiz = 1, Idquestion = 4, Answer = "Tak", Iscorrect = 0 },
            new () { Idquiz = 1, Idquestion = 4, Answer = "Nie", Iscorrect = 1 },
            new () { Idquiz = 1, Idquestion = 4, Answer = "Bóg", Iscorrect = 1 },
            new () { Idquiz = 1, Idquestion = 4, Answer = "Nie wiem", Iscorrect = 1 },

            new () { Idquiz = 1, Idquestion = 5, Answer = "Tak", Iscorrect = 1 },
            new () { Idquiz = 1, Idquestion = 5, Answer = "Nie", Iscorrect = 1 },
            new () { Idquiz = 1, Idquestion = 5, Answer = "Bóg", Iscorrect = 1 },
            new () { Idquiz = 1, Idquestion = 5, Answer = "Nie wiem", Iscorrect = 0 },

            new () { Idquiz = 1, Idquestion = 6, Answer = "Tak", Iscorrect = 1 },
            new () { Idquiz = 1, Idquestion = 6, Answer = "Nie", Iscorrect = 0 },
        };

        InsertCollection(list);
    }
}