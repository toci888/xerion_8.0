using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.Quizzes
{
    public class QuizRegisterDto : ModelBase
    {
        public QuizDto Quiz { get; set; }
        public List<QuizzesRegisterAnswerDto> QuizzesAnswers { get; set; }
        public List<QuizzesRegisterQuestionDto> QuizzesQuestions { get; set; }
    }
}
