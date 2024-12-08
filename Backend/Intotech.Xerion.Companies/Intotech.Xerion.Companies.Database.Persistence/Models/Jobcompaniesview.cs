using System;
using System.Collections.Generic;
using Intotech.Common.Bll.Interfaces;

namespace Intotech.Xerion.Companies.Database.Persistence.Models;

public partial class Jobcompaniesview : ModelBase
{
    public string? Jobname { get; set; }

    public string? Jobpublicid { get; set; }

    public string? Jobimage { get; set; }

    public string? Jobdescription { get; set; }

    public int? Jobemploymentmethod { get; set; }

    public int? Jobemploymenttype { get; set; }

    public DateTime? Jobexpirationdate { get; set; }

    public double? Jobsalarymin { get; set; }

    public double? Jobsalarymax { get; set; }

    public int? Jobquizid { get; set; }

    public int? Jobcompanyid { get; set; }

    public int? Companyid { get; set; }

    public string? Companylogo { get; set; }

    public string? Companynip { get; set; }

    public string? Companyname { get; set; }

    public string? Companyheadquarteraddress { get; set; }

    public string? Companydescription { get; set; }

    public int? Companyemployeecount { get; set; }

    public int? Companyidaccount { get; set; }

    public DateTime? Companyestablishment { get; set; }
}
