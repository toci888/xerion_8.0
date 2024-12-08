using Intotech.Common.Bll.Interfaces; 
using System;
 using System.Collections.Generic;
 
 namespace Intotech.Xerion.Dictionaries.Database.Persistence.Models;
 
 public partial class Softskill : ModelBase

 {
     public int Id { get; set; }
 
     public string Name { get; set; } = null!;
 }
 