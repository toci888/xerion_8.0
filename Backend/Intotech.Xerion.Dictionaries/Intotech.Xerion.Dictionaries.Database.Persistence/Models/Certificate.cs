using Intotech.Common.Bll.Interfaces; 
using System;
 using System.Collections.Generic;
 
 namespace Intotech.Xerion.Dictionaries.Database.Persistence.Models;
 
 public partial class Certificate : ModelBase

 {
     public int Id { get; set; }
 
     public string Name { get; set; } = null!;
 
     public string? Serialnumber { get; set; }
 
     public DateTime Obtainingdate { get; set; }
 
     public DateTime? Expirationdate { get; set; }
 }
 