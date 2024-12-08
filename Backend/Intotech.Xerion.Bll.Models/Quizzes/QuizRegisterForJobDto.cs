using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.Quizzes
{
    public class QuizData : ModelBase
    {
        public string QuizName { get; set; }
        public int MaxDuration { get; set; }
        public int MaxPoints { get; set; }
        public List<QuestionData> Questions { get; set; }
    }

    public class QuestionData : ModelBase
    {
        public string QuestionContent { get; set; }
        public List<CorrectAnswerData> CorrectAnswers { get; set; }
        public string FalseAnswer { get; set; }
    }

    public class CorrectAnswerData : ModelBase
    {
        public string CorrectAnswer { get; set; }
    }
}
