using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.Quizzes
{
    public class QuizzesAnswerDto : ModelBase
    {
        public string Answer { get; set; } = null!;

        public string? Image { get; set; }

        public int Idquestion { get; set; }

        public int Idquiz { get; set; }

        public string? Totaltime { get; set; }

        public double Totalscore { get; set; }

        public string? Additionaltext { get; set; }
    }
}
