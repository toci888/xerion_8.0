using Intotech.Xerion.Dictionaries.Bll.Persistence;
using Intotech.Xerion.Dictionaries.Bll.Persistence.Interfaces;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Dictionaries;

public class SeedManager : SeedLogicDict<Profession>
{
    protected IProfessionsLogic ProfessionsLogic = new ProfessionsLogic();
    protected IFrameworkLanguageLogic FrameworkLanguageLogic = new FrameworkLanguageLogic();
    protected ISkillsDomainLogic SkillsDomainLogic = new SkillsDomainLogic();
    protected FileParser FileParser = new();

    public void SeedProfessions(string sqlDataFilePath)
    {
        bool isAlreadyDataInDb = ProfessionsLogic.Select(x => true).Any();
        if (!isAlreadyDataInDb)
        {
            List<Profession> professions = FileParser.ParseProfessions(sqlDataFilePath);

            foreach (Profession profession in professions)
            {
                ProfessionsLogic.Insert(new Profession()
                {
                    Name = profession.Name
                });
            }
        }
    }

    public void SeedLanguagesAndFrameworks(string sqlDataFilePath)
    {
        bool isAlreadyDataInDb = FrameworkLanguageLogic.Select(x => true).Any();
        if (!isAlreadyDataInDb)
        {
            List<Framework> languagesAndFrameworks = FileParser.ParseLanguagesAndFrameworks(sqlDataFilePath);

            foreach (Framework laf in languagesAndFrameworks)
            {
                Skillsdomain? domainCategory = SkillsDomainLogic.Select(m => m.Domain == laf.Category).FirstOrDefault();

                if (domainCategory == null)
                {
                    domainCategory = SkillsDomainLogic.Insert(new Skillsdomain()
                    {
                        Domain = laf.Category,
                        Isfinal = 1
                    });

                    Skillsdomain domainLanguage = SkillsDomainLogic.Insert(new Skillsdomain()
                    {
                        Domain = laf.Language,
                        Isfinal = laf.Frameworks.Length > 0 ? 1 : 3,
                        Idparent = domainCategory.Id,
                    });

                    SkillsDomainLogic.Insert(new Skillsdomain()
                    {
                        Domain = laf.Frameworks,
                        Isfinal = 2,
                        Idparent = domainLanguage.Id,
                    });
                }
                else
                {
                    Skillsdomain? domainLanguage = SkillsDomainLogic.Select(m => m.Domain == laf.Language && m.Idparent == domainCategory.Id).FirstOrDefault();

                    if (domainLanguage == null)
                    {
                        domainLanguage = SkillsDomainLogic.Insert(new Skillsdomain()
                        {
                            Domain = laf.Language,
                            Isfinal = laf.Frameworks.Length > 0 ? 1 : 3,
                            Idparent = domainCategory.Id,
                        });

                        SkillsDomainLogic.Insert(new Skillsdomain()
                        {
                            Domain = laf.Frameworks,
                            Isfinal = 2,
                            Idparent = domainLanguage.Id,
                        });
                    }
                    else
                    {
                        Skillsdomain? domainFramework = SkillsDomainLogic.Select(m => m.Domain == laf.Frameworks).FirstOrDefault();

                        if (domainFramework == null)
                        {
                            domainFramework = SkillsDomainLogic.Insert(new Skillsdomain()
                            {
                                Domain = laf.Frameworks,
                                Isfinal = 2,
                                Idparent = domainLanguage.Id,
                            });
                        }
                    }
                }
            }
        }
    }

    public override void Insert()
    {
        throw new NotImplementedException();
    }
}