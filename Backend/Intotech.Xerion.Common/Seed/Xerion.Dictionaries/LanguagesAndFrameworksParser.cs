using Intotech.Xerion.Dictionaries.Bll.Persistence;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Dictionaries
{
    public class LanguagesAndFrameworksParser : SeedLogicDict<Framework>
    {
        public override void Insert()
        {
            string sqlDataFilePath = "SQL/Data/languagesAndFrameworks.txt";

            SeedLanguagesAndFrameworks(sqlDataFilePath);

            //InsertCollection();
        }

        public void SeedLanguagesAndFrameworks(string sqlDataFilePath)
        {
            bool isAlreadyDataInDb = new FrameworkLanguageLogic().Select(x => true).Any();
            if (!isAlreadyDataInDb)
            {
                List<Framework> languagesAndFrameworks = FileParser.ParseLanguagesAndFrameworks(sqlDataFilePath);

                foreach (Framework laf in languagesAndFrameworks)
                {
                    Skillsdomain? domainCategory = new SkillsDomainLogic().Select(m => m.Domain == laf.Category).FirstOrDefault();

                    if (domainCategory == null)
                    {
                        domainCategory = new SkillsDomainLogic().Insert(new Skillsdomain()
                        {
                            Domain = laf.Category,
                            Isfinal = 1
                        });

                        Skillsdomain domainLanguage = new SkillsDomainLogic().Insert(new Skillsdomain()
                        {
                            Domain = laf.Language,
                            Isfinal = laf.Frameworks.Length > 0 ? 1 : 3,
                            Idparent = domainCategory.Id,
                        });

                        new SkillsDomainLogic().Insert(new Skillsdomain()
                        {
                            Domain = laf.Frameworks,
                            Isfinal = 2,
                            Idparent = domainLanguage.Id,
                        });
                    }
                    else
                    {
                        Skillsdomain? domainLanguage = new SkillsDomainLogic().Select(m => m.Domain == laf.Language && m.Idparent == domainCategory.Id).FirstOrDefault();

                        if (domainLanguage == null)
                        {
                            domainLanguage = new SkillsDomainLogic().Insert(new Skillsdomain()
                            {
                                Domain = laf.Language,
                                Isfinal = laf.Frameworks.Length > 0 ? 1 : 3,
                                Idparent = domainCategory.Id,
                            });

                            new SkillsDomainLogic().Insert(new Skillsdomain()
                            {
                                Domain = laf.Frameworks,
                                Isfinal = 2,
                                Idparent = domainLanguage.Id,
                            });
                        }
                        else
                        {
                            Skillsdomain? domainFramework = new SkillsDomainLogic().Select(m => m.Domain == laf.Frameworks).FirstOrDefault();

                            if (domainFramework == null)
                            {
                                domainFramework = new SkillsDomainLogic().Insert(new Skillsdomain()
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
    }
}