using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Quizzes.Database.Persistence.Models;

public partial class Quizzesanswer : ModelBase
{
    public int Id { get; set; }

    public string Answer { get; set; } = null!;

    public string? Additionaltext { get; set; }

    public int Iscorrect { get; set; }

    public string? Image { get; set; }

    public double Totalscore { get; set; }

    public string? Totaltime { get; set; }

    public int Idquestion { get; set; }

    public int Idquiz { get; set; }

    public virtual Quizzesquestion IdquestionNavigation { get; set; } = null!;

    public virtual Quiz IdquizNavigation { get; set; } = null!;

    public virtual ICollection<Quizzesresult> Quizzesresults { get; } = new List<Quizzesresult>();
}
