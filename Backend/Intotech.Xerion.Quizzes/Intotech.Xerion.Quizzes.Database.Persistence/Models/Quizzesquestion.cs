using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Quizzes.Database.Persistence.Models;

public partial class Quizzesquestion : ModelBase
{
    public int Id { get; set; }

    public string Question { get; set; } = null!;

    public string? Additionaltext { get; set; }

    public int Type { get; set; }

    public double Totalscore { get; set; }

    public string? Totaltime { get; set; }

    public string? Image { get; set; }

    public int Idquiz { get; set; }

    public virtual Quiz IdquizNavigation { get; set; } = null!;

    public virtual ICollection<Quizzesanswer> Quizzesanswers { get; } = new List<Quizzesanswer>();
}
