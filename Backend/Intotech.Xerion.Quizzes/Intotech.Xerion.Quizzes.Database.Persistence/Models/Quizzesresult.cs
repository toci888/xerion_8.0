using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Quizzes.Database.Persistence.Models;

public partial class Quizzesresult : ModelBase
{
    public int Id { get; set; }

    public int Idaccount { get; set; }

    public double Score { get; set; }

    public string? Elapsedtime { get; set; }

    public string Answer { get; set; } = null!;

    public int Idquizzesanswer { get; set; }

    public int Idquiz { get; set; }

    public int Idquizzesattempt { get; set; }

    public virtual Quiz IdquizNavigation { get; set; } = null!;

    public virtual Quizzesanswer IdquizzesanswerNavigation { get; set; } = null!;

    public virtual Quizzesattempt IdquizzesattemptNavigation { get; set; } = null!;
}
