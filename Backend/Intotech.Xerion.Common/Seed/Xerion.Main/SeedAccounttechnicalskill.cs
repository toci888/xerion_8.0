using Intotech.Xerion.Bll.Models.Enums;
using Intotech.Xerion.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Main;

public class SeedAccounttechnicalskill : SeedXerionMainLogic<Accounttechnicalskill>
{
    public override void Insert()
    {
        List<Accounttechnicalskill> list = new List<Accounttechnicalskill>
        {
            new () { Name = "C#", Progress = 0.32, Idaccount = 1 , Type = (int)AccountTechnicalSkillsEnum.Backend},
            new () { Name = "React", Progress = 0.65, Idaccount = 1, Type = (int)AccountTechnicalSkillsEnum.Frontend},
            new () { Name = "Angular", Progress = 0.99, Idaccount = 1, Type = (int)AccountTechnicalSkillsEnum.Frontend}
        };

        InsertCollection(list);
    }
}