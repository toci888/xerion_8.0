using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Quizzes.Database.Persistence.Models;

public partial class Quizzesattempt : ModelBase
{
    public int Id { get; set; }

    public string? Totalelapsedtime { get; set; }

    public double? Totalparticipantscore { get; set; }

    public int Idaccount { get; set; }

    public int Idquiz { get; set; }

    public virtual Quiz IdquizNavigation { get; set; } = null!;

    public virtual ICollection<Quizzesresult> Quizzesresults { get; } = new List<Quizzesresult>();
}
