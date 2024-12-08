using Intotech.Xerion.Common.Seed.Xerion.Companies;

namespace Intotech.Xerion.Common.Seed.Xerion.Quizzes;

public class XerionQuizzesSeedManager
{
    public virtual void SeedAllDb()
    {
        new SeedQuizzes().Insert();
        new SeedQuizzesQuestions().Insert();
        new SeedQuizzesAnswers().Insert();
        new SeedQuizzesAttempts().Insert();
        new SeedQuizzesResults().Insert();
    }
}