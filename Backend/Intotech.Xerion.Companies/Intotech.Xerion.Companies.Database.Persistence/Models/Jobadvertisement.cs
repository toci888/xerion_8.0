using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Companies.Database.Persistence.Models;

public partial class Jobadvertisement : ModelBase
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Publicid { get; set; }

    public string? Image { get; set; }

    public string Description { get; set; } = null!;

    public int Employmentmethod { get; set; }

    public int Employmenttype { get; set; }

    public DateTime? Expirationdate { get; set; }

    public double? Salarymin { get; set; }

    public double? Salarymax { get; set; }

    public int? Quizid { get; set; }

    public int Companyid { get; set; }

    public virtual Company Company { get; set; } = null!;

    public virtual ICollection<Jobapplication> Jobapplications { get; } = new List<Jobapplication>();

    public virtual ICollection<Jobdetail> Jobdetails { get; } = new List<Jobdetail>();

    public virtual ICollection<Jobtechnology> Jobtechnologies { get; } = new List<Jobtechnology>();
}
