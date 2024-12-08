using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class Account : ModelBase
{
    // public int Id { get; set; }

    public string Email { get; set; } = null!;

    public string? Title { get; set; }

    public string? Name { get; set; }

    public string? Surname { get; set; }

    public string? Phonenumber { get; set; }

    public string? Description { get; set; }

    public DateTime? Birthdate { get; set; }

    public string Password { get; set; } = null!;

    public int? Verificationcode { get; set; }

    public DateTime? Verificationcodevalid { get; set; }

    public int? Idrole { get; set; }

    public bool? Emailconfirmed { get; set; }

    public bool? Allowsnotifications { get; set; }

    public string? Image { get; set; }

    public string? Refreshtoken { get; set; }

    public DateTime? Refreshtokenvalid { get; set; }

    public DateTime? Createdat { get; set; }

    public DateTime? Lastmodificationdate { get; set; }

    public double? Salarymin { get; set; }

    public double? Salarymax { get; set; }

    public string? Location { get; set; }

    public int? Employmentmethod { get; set; }

    public int? Employmenttype { get; set; }

    public virtual ICollection<Accountcoursescertificate> Accountcoursescertificates { get; } = new List<Accountcoursescertificate>();

    public virtual ICollection<Accounteducation> Accounteducations { get; } = new List<Accounteducation>();

    public virtual ICollection<Accountforeignlanguage> Accountforeignlanguages { get; } = new List<Accountforeignlanguage>();

    public virtual ICollection<Accountsocialmedialink> Accountsocialmedialinks { get; } = new List<Accountsocialmedialink>();

    public virtual ICollection<Accountsoftskill> Accountsoftskills { get; } = new List<Accountsoftskill>();

    public virtual ICollection<Accounttag> Accounttags { get; } = new List<Accounttag>();

    public virtual ICollection<Accounttechnicalskill> Accounttechnicalskills { get; } = new List<Accounttechnicalskill>();

    public virtual ICollection<Accountworkexperience> Accountworkexperiences { get; } = new List<Accountworkexperience>();

    public virtual ICollection<Accountworkresponsibility> Accountworkresponsibilities { get; } = new List<Accountworkresponsibility>();

    public virtual ICollection<Failedloginattempt> Failedloginattempts { get; } = new List<Failedloginattempt>();

    public virtual Role? IdroleNavigation { get; set; }

    public virtual ICollection<Pushtoken> Pushtokens { get; } = new List<Pushtoken>();

    public virtual ICollection<Userextradatum> Userextradata { get; } = new List<Userextradatum>();
}
