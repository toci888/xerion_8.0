using Intotech.Common.Bll.Interfaces; 
using System;
 using System.Collections.Generic;
 
 namespace Intotech.Xerion.Dictionaries.Database.Persistence.Models;
 
 public partial class Framework : DictionaryModelBase

 {
     public int Id { get; set; }
 
     public string Name { get; set; } = null!;
 
     public int? Idcategory { get; set; }
 
     public int? Idprogramminglanguage { get; set; }
 
     public virtual Programminglanguagecategory? IdcategoryNavigation { get; set; }
 
     public virtual Programminglanguage? IdprogramminglanguageNavigation { get; set; }
 }
 