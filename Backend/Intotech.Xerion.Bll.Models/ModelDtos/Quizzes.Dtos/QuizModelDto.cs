using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Intotech.Xerion.Bll.Models.ModelDtos.Quizzes.Dtos
{
    public class QuizModelDto
    {
        public int Id { get; set; }

        public string? Image { get; set; }

        public string Name { get; set; } = null!;

        public string? Description { get; set; }

        public int Idcompany { get; set; }

        public string? Totaltime { get; set; }

        public int Type { get; set; }

        public double? Totalscore { get; set; }

        public double Passingthreshold { get; set; }
    }
}
