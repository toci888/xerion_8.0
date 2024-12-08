using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.Quizzes
{
    public class QuizzesResultDto : ModelBase
    {
        public int Idaccount { get; set; }

        public int Idquiz { get; set; }

        public int Idquestion { get; set; }

        public string? Elapsedtime { get; set; }

        public string Answer { get; set; }

        public int Idquizzesanswer { get; set; }
    }
}
