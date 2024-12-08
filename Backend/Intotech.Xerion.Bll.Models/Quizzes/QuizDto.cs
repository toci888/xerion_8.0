using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Bll.Models.Quizzes
{
    public class QuizDto : ModelBase
    {
        public string? Image { get; set; }

        public string Name { get; set; } = null!;

        public string? Description { get; set; }

        public string? IdQuestion { get; set; }

        public double? Totalscore { get; set; }

        public string? Totaltime { get; set; }

        public int Idcompany { get; set; }

        public string Technology { get; set; } = null!;

        public int? TechnologyType { get; set; } = null!;

        public int Type { get; set; }

        public double Passingthreshold { get; set; }
    }
}
