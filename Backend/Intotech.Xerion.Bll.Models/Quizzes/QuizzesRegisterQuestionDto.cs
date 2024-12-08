using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.Quizzes
{
    public class QuizzesRegisterQuestionDto : ModelBase
    {
        public string Question { get; set; } = null!;

        public string? Additionaltext { get; set; }

        public int Type { get; set; }

        public double Totalscore { get; set; }

        public string? Image { get; set; }
    }
}
