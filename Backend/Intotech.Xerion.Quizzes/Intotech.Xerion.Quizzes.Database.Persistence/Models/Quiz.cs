using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Quizzes.Database.Persistence.Models;

public partial class Quiz : ModelBase
{
    public int Id { get; set; }

    public string? Image { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public double? Totalscore { get; set; }

    public double Passingthreshold { get; set; }

    public string? Totaltime { get; set; }

    public int Idcompany { get; set; }

    public string Technology { get; set; } = null!;

    public int Type { get; set; }

    public virtual ICollection<Quizzesanswer> Quizzesanswers { get; } = new List<Quizzesanswer>();

    public virtual ICollection<Quizzesattempt> Quizzesattempts { get; } = new List<Quizzesattempt>();

    public virtual ICollection<Quizzesquestion> Quizzesquestions { get; } = new List<Quizzesquestion>();

    public virtual ICollection<Quizzesresult> Quizzesresults { get; } = new List<Quizzesresult>();
}
