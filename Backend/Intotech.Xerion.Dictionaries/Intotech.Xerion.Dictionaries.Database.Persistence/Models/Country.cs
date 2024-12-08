using Intotech.Common.Bll.Interfaces; 
using System;
 using System.Collections.Generic;
 
 namespace Intotech.Xerion.Dictionaries.Database.Persistence.Models;
 
 public partial class Country : ModelBase

 {
     public int Id { get; set; }
 
     public string Name { get; set; } = null!;
 
     public virtual ICollection<City> Cities { get; } = new List<City>();
 
     public virtual ICollection<Foreignlanguage> Foreignlanguages { get; } = new List<Foreignlanguage>();
 }
 