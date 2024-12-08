using Intotech.Common;
using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Intotech.Common.Interfaces;
using Intotech.Xerion.Bll.Models.Accounts;
using Intotech.Xerion.Bll.Models.Enums;
using Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;
using Intotech.Xerion.Bll.Models.ModelDtos.Quizzes.Dtos;
using Intotech.Xerion.Bll.Models.ModelMappers.Quizzes;
using Intotech.Xerion.Bll.Models.Quizzes;
using Intotech.Xerion.Bll.Persistence;
using Intotech.Xerion.Bll.Persistence.Interfaces;
using Intotech.Xerion.Common.I18n;
using Intotech.Xerion.Common.Interfaces;
using Intotech.Xerion.Common.Logging;
using Intotech.Xerion.Companies.Bll.Persistence.Interfaces;
using Intotech.Xerion.Quizzes.Bll.Interfaces;
using Intotech.Xerion.Quizzes.Bll.Persistence.Interfaces;
using Intotech.Xerion.Quizzes.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;
using Microsoft.AspNetCore.Mvc;

namespace Intotech.Xerion.Quizzes.Bll
{
    public class QuizService : LoggerServiceBase, IQuizService
    {
        protected IQuizLogic QuizLogic;
        protected IQuizzesAnswersLogic QuizzesAnswersLogic;
        protected IQuizzesQuestionsLogic QuizzesQuestionsLogic;
        protected IQuizzesResultsLogic QuizzesResultsLogic;
        protected IQuizzesAttemptsLogic QuizzesAttemptsLogic;
        protected IJobLogic JobAdvertisementLogic;
        protected IAccounttechnicalskillLogic AccounttechnicalskillLogic;
        protected IAccountLogic AccountLogic;

        public QuizService(ITranslationEngineI18n i18nTranslation,
            IQuizLogic quizLogic,
            IQuizzesAnswersLogic quizzesAnswersLogic,
            IQuizzesQuestionsLogic quizzesQuestionsLogic,
            IQuizzesResultsLogic quizzesResultsLogic,
            IQuizzesAttemptsLogic quizzesAttemptsLogic,
            IJobLogic jobAdvertisementLogic,
            IAccounttechnicalskillLogic accounttechnicalskillLogic,
            IAccountLogic accountLogic
            ) : base(i18nTranslation)
        {
            QuizLogic = quizLogic;
            QuizzesAnswersLogic = quizzesAnswersLogic;
            QuizzesQuestionsLogic = quizzesQuestionsLogic;
            QuizzesResultsLogic = quizzesResultsLogic;
            QuizzesAttemptsLogic = quizzesAttemptsLogic;
            JobAdvertisementLogic = jobAdvertisementLogic;
            AccounttechnicalskillLogic = accounttechnicalskillLogic;
            AccountLogic = accountLogic;
        }

        public ReturnedResponse<QuizRegisterDto> Create(QuizRegisterDto quizDto)
        {
            if (quizDto == null)
            {
                return new ReturnedResponse<QuizRegisterDto>(null, I18nTranslationDep.Translation(I18nTags.Error), false, ErrorCodes.NoData);
            }

            Quiz quiz = new Quiz()
            {
                Idcompany = quizDto.Quiz.Idcompany,
                Type = quizDto.Quiz.Type,
                Description = quizDto.Quiz.Description,
                Name = quizDto.Quiz.Name,
                Image = quizDto.Quiz.Image,
                Technology = quizDto.Quiz.Technology,
                Totalscore = quizDto.Quiz.Totalscore,
                Totaltime = quizDto.Quiz.Totaltime,
                Passingthreshold = quizDto.Quiz.Passingthreshold,
            };

            Quiz newQuiz = QuizLogic.Insert(quiz);

            quizDto.Id = newQuiz.Id;

            //List<Quizzesanswer> answersCollection = new List<Quizzesanswer>();
            //if (quizDto.QuizzesAnswers == null || quizDto.QuizzesAnswers.Count() == 0)
            //{
            //    answersCollection = QuizLogic.Select(x => quizDto.Quiz.Idcompany == x.Idcompany).ToList();
            //}
            //else
            //{
            //    answersCollection = QuizzesAnswersLogic.Select(x => quizDto.QuizzesAnswers[0].Idquiz == x.Idquiz).ToList();
            //}
            //answersCollection.ForEach(item => QuizzesAnswersLogic.Delete(item));
            foreach (var quizzesAnswer in quizDto.QuizzesAnswers)
            {
                Quizzesanswer quizzesAnswerModelDto = new Quizzesanswer()
                {
                    Answer = quizzesAnswer.Answer,
                    Iscorrect = quizzesAnswer.Iscorrect,
                    Image = quizzesAnswer.Image,
                    Idquestion = quizzesAnswer.Idquestion,
                    Totaltime = quizzesAnswer.Totaltime,
                    Totalscore = quizzesAnswer.Totalscore,
                    Additionaltext = quizzesAnswer.Additionaltext,
                    Idquiz = quiz.Id,
                };

                QuizzesAnswersLogic.Insert(quizzesAnswerModelDto);
            }

            //List<Quizzesquestion> questionsCollection = new List<Quizzesquestion>();
            //if (quizDto.QuizzesQuestions == null || quizDto.QuizzesQuestions.Count() == 0)
            //{
            //    questionsCollection = QuizzesQuestionsLogic.Select(x => quizDto.Quiz.Idcompany == x.).ToList();
            //}
            //else
            //{
            //    questionsCollection = QuizzesQuestionsLogic.Select(x => quizDto.QuizzesQuestions[0].Idquiz == x.Idquiz).ToList();
            //}
            //questionsCollection.ForEach(item => QuizzesQuestionsLogic.Delete(item));
            foreach (var quizzesQuestion in quizDto.QuizzesQuestions)
            {
                Quizzesquestion quizzesQuestionModelDto = new Quizzesquestion()
                {
                    Id = quizzesQuestion.Id,
                    Question = quizzesQuestion.Question,
                    Additionaltext = quizzesQuestion.Additionaltext,
                    Totalscore = quizzesQuestion.Totalscore,
                    Image = quizzesQuestion.Image,
                    Idquiz = quiz.Id,
                    Totaltime = quiz.Totaltime,
                    Type = quiz.Type,
                };

                QuizzesQuestionsLogic.Insert(quizzesQuestionModelDto);
            }

            return new ReturnedResponse<QuizRegisterDto>(quizDto, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public ReturnedResponse<QuizRegisterDto> CreateForJob(int idJobAdvertisement, QuizRegisterDto quizDto)
        {
            if (quizDto == null)
            {
                return new ReturnedResponse<QuizRegisterDto>(null, I18nTranslationDep.Translation(I18nTags.Error), false, ErrorCodes.NoData);
            }

            Quiz quiz = new Quiz()
            {
                Idcompany = quizDto.Quiz.Idcompany,
                Type = quizDto.Quiz.Type,
                Description = quizDto.Quiz.Description,
                Name = quizDto.Quiz.Name,
                Image = quizDto.Quiz.Image,
                Technology = quizDto.Quiz.Technology,
                Totalscore = quizDto.Quiz.Totalscore,
                Totaltime = quizDto.Quiz.Totaltime,
                Passingthreshold = quizDto.Quiz.Passingthreshold,
            };

            Quiz newQuiz = QuizLogic.Insert(quiz);

            quizDto.Id = newQuiz.Id;

            var job = JobAdvertisementLogic.Select(x => x.Id == idJobAdvertisement).FirstOrDefault();
            if (job != null)
            {
                job.Quizid = quizDto.Id;
                JobAdvertisementLogic.Update(job);
            }


            foreach (var quizzesQuestion in quizDto.QuizzesQuestions)
            {
                int type = (int)QuizzesTypesEnum.SingleChoiceQuestion;

                var correctAAnswersCount = quizDto.QuizzesAnswers.Count(x => x.Idquestion == quizzesQuestion.Id && x.Iscorrect == 1);
                if (correctAAnswersCount > 1)
                {
                    type = (int)QuizzesTypesEnum.MultipleChoiceQuestion;
                }

                Quizzesquestion quizzesQuestionModelDto = new Quizzesquestion()
                {
                    Question = quizzesQuestion.Question,
                    Additionaltext = quizzesQuestion.Additionaltext,
                    Totalscore = quizzesQuestion.Totalscore,
                    Image = quizzesQuestion.Image,
                    Idquiz = quizDto.Id,
                    Totaltime = quiz.Totaltime,
                    Type = type,
                };

                Quizzesquestion question = QuizzesQuestionsLogic.Insert(quizzesQuestionModelDto);

                foreach (var quizzesAnswer in quizDto.QuizzesAnswers.FindAll(x => x.Idquestion == quizzesQuestion.Id))
                {
                    Quizzesanswer quizzesAnswerModelDto = new Quizzesanswer()
                    {
                        Answer = quizzesAnswer.Answer,
                        Iscorrect = quizzesAnswer.Iscorrect,
                        Image = quizzesAnswer.Image,
                        Idquestion = question.Id,
                        Totaltime = quizzesAnswer.Totaltime,
                        Totalscore = quizzesAnswer.Totalscore,
                        Additionaltext = quizzesAnswer.Additionaltext,
                        Idquiz = question.Idquiz,
                    };

                    QuizzesAnswersLogic.Insert(quizzesAnswerModelDto);
                }
            }

            return new ReturnedResponse<QuizRegisterDto>(quizDto, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public ReturnedResponse<GetQuizCompleteDto> GetCompleteQuizById(int quizId)
        {
            Quiz? quiz = QuizLogic.Select(m => m.Id == quizId).FirstOrDefault();
            List<Quizzesanswer> quizzesanswers = QuizzesAnswersLogic.Select(m => m.Idquiz == quizId).ToList();
            List<Quizzesquestion> quizzesQuestions = QuizzesQuestionsLogic.Select(m => m.Idquiz == quizId).ToList();
            List<Quizzesresult> quizzesResults = QuizzesResultsLogic.Select(m => m.Idquiz == quizId).ToList();

            if (quiz == null)
            {
                return new ReturnedResponse<GetQuizCompleteDto>(null, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
            }

            QuizModelDto quizModelDto = new QuizModelDto()
            {
                Id = quiz.Id,
                Type = quiz.Type,
                Description = quiz.Description,
                Idcompany = quiz.Idcompany,
                Image = quiz.Image,
                Name = quiz.Name,
                Totaltime = quiz.Totaltime,
                Totalscore = quiz.Totalscore,
                Passingthreshold = quiz.Passingthreshold,
            };

            GetQuizCompleteDto quizComplete = new GetQuizCompleteDto()
            {
                Quiz = quizModelDto,
                QuizzesAnswer = quizzesanswers,
                QuizzesQuestions = quizzesQuestions,
                QuizzesResults = quizzesResults,
            };

            return new ReturnedResponse<GetQuizCompleteDto>(quizComplete, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public ReturnedResponse<GetQuizDto> GetQuizByJobAdvertisement(int idJobAdvertisement)
        {
            var job = JobAdvertisementLogic.Select(x => x.Id == idJobAdvertisement).FirstOrDefault();

            if (job == null)
            {
                return new ReturnedResponse<GetQuizDto>(null, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
            }

            Quiz? quiz = QuizLogic.Select(m => m.Id == job.Quizid).FirstOrDefault();
            List<Quizzesanswer> quizzesanswers = QuizzesAnswersLogic.Select(m => m.Idquiz == quiz.Id).ToList();
            List<Quizzesquestion> quizzesQuestions = QuizzesQuestionsLogic.Select(m => m.Idquiz == quiz.Id).ToList();

            if (quiz == null)
            {
                return new ReturnedResponse<GetQuizDto>(null, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
            }

            var quizzesAnswersMapped = new List<QuizzesAnswerDto>();
            foreach (var quizzesanswer in quizzesanswers)
            {
                quizzesAnswersMapped.Add(QuizzesMapper.Map(quizzesanswer));
            }

            var quizzesQuestionsMapped = new List<QuizzesQuestionDto>();
            foreach (var quizzesQuestion in quizzesQuestions)
            {
                quizzesQuestionsMapped.Add(QuizzesMapper.Map(quizzesQuestion));
            }

            QuizModelDto quizModelDto = new QuizModelDto()
            {
                Id = quiz.Id,
                Type = quiz.Type,
                Description = quiz.Description,
                Idcompany = quiz.Idcompany,
                Image = quiz.Image,
                Name = quiz.Name,
                Totalscore = quiz.Totalscore,
                Totaltime = quiz.Totaltime,
                Passingthreshold = quiz.Passingthreshold
            };

            var random = new Random();
            quizzesAnswersMapped = quizzesAnswersMapped.OrderBy(x => random.Next()).ToList();

            GetQuizDto quizComplete = new GetQuizDto()
            {
                Quiz = quizModelDto,
                QuizzesAnswers = quizzesAnswersMapped,
                QuizzesQuestions = quizzesQuestionsMapped
            };

            return new ReturnedResponse<GetQuizDto>(quizComplete, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public ReturnedResponse<List<Quiz>> GetQuizzes(int idCompany)
        {
            List<Quiz> quizzes = QuizLogic.Select(m => m.Idcompany == idCompany).ToList();

            return new ReturnedResponse<List<Quiz>>(quizzes, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public ReturnedResponse<QuizUpdateCompleteDto> UpdateQuiz(QuizUpdateCompleteDto prevQuiz)
        {
            if (prevQuiz.Quiz == null)
            {
                return new ReturnedResponse<QuizUpdateCompleteDto>(null, I18nTranslationDep.Translation(I18nTags.AccountNotFound), false, ErrorCodes.AccountNotFound);
            }

            Quiz quizModelDto = new Quiz()
            {
                Id = prevQuiz.Quiz.Id,
                Type = prevQuiz.Quiz.Type,
                Description = prevQuiz.Quiz.Description,
                Idcompany = prevQuiz.Quiz.Idcompany,
                Image = prevQuiz.Quiz.Image,
                Name = prevQuiz.Quiz.Name,
                Technology = prevQuiz.Quiz.Name,
                Totalscore = prevQuiz.Quiz.Totalscore,
                Totaltime = prevQuiz.Quiz.Totaltime,
                Passingthreshold = prevQuiz.Quiz.Passingthreshold
            };

            Quiz? updatedQuiz = QuizLogic.Update(quizModelDto);

            List<Quizzesanswer> answersCollection = new List<Quizzesanswer>();
            if (prevQuiz.QuizzesAnswers == null || prevQuiz.QuizzesAnswers.Count() == 0)
            {
                answersCollection = QuizzesAnswersLogic.Select(x => prevQuiz.Quiz.Id == x.Idquiz).ToList();
            }
            else
            {
                answersCollection = QuizzesAnswersLogic.Select(x => prevQuiz.QuizzesAnswers[0].Idquestion == x.Idquestion).ToList();
            }
            answersCollection.ForEach(item => QuizzesAnswersLogic.Delete(item));
            foreach (var quizzesAnswer in prevQuiz.QuizzesAnswers)
            {
                Quizzesanswer quizzesAnswerModelDto = new Quizzesanswer()
                {
                    Answer = quizzesAnswer.Answer,
                    Image = quizzesAnswer.Image,
                    Idquestion = quizzesAnswer.Idquestion,
                    Idquiz = quizzesAnswer.Idquiz,
                    Iscorrect = quizzesAnswer.Iscorrect,
                    Totaltime = quizzesAnswer.Totaltime,
                    Totalscore = quizzesAnswer.Totalscore,
                    Additionaltext = quizzesAnswer.Additionaltext,
                };

                QuizzesAnswersLogic.Update(quizzesAnswerModelDto);
            }

            List<Quizzesquestion> questionsCollection = new List<Quizzesquestion>();
            if (prevQuiz.QuizzesQuestions == null || prevQuiz.QuizzesQuestions.Count() == 0)
            {
                questionsCollection = QuizzesQuestionsLogic.Select(x => prevQuiz.Quiz.Id == x.Idquiz).ToList();
            }
            else
            {
                questionsCollection = QuizzesQuestionsLogic.Select(x => prevQuiz.QuizzesQuestions[0].Idquiz == x.Idquiz).ToList();
            }
            questionsCollection.ForEach(item => QuizzesQuestionsLogic.Delete(item));
            foreach (var quizzesQuestion in prevQuiz.QuizzesQuestions)
            {
                Quizzesquestion quizzesQuestionModelDto = new Quizzesquestion()
                {
                    Id = quizzesQuestion.Id,
                    Question = quizzesQuestion.Question,
                    Additionaltext = quizzesQuestion.Additionaltext,
                    Totalscore = quizzesQuestion.Totalscore,
                    Image = quizzesQuestion.Image,
                    Idquiz = quizzesQuestion.Idquiz,
                    Totaltime = quizzesQuestion.Totaltime,
                };

                QuizzesQuestionsLogic.Update(quizzesQuestionModelDto);
            }

            return new ReturnedResponse<QuizUpdateCompleteDto>(prevQuiz, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public ReturnedResponse<int> SendResults(List<QuizzesResultDto> quizzesResults)
        {
            if (quizzesResults == null || quizzesResults.Count == 0)
            {
                return new ReturnedResponse<int>(0, I18nTranslationDep.Translation(I18nTags.Error), false, ErrorCodes.NoData);
            }

            bool hasAttempt = QuizzesAttemptsLogic.Select(
                m => m.Idaccount == quizzesResults[0].Idaccount
                     && m.Idquiz == quizzesResults[0].Idquiz).Any();

            if (hasAttempt)
            {
                try
                {
                    QuizzesResultsLogic.Delete(m =>
                    m.Idaccount == quizzesResults[0].Idaccount && m.Idquiz == quizzesResults[0].Idquiz);

                    QuizzesAttemptsLogic.Delete(m =>
                        m.Idaccount == quizzesResults[0].Idaccount && m.Idquiz == quizzesResults[0].Idquiz);
                }
                catch (Exception ex) { }

            }

            Quizzesattempt quizAttempt = QuizzesAttemptsLogic.Insert(new Quizzesattempt()
            {
                Idquiz = quizzesResults[0].Idquiz,
                Idaccount = quizzesResults[0].Idaccount,
                Totalelapsedtime = quizzesResults[0].Elapsedtime
            });

            double totalScore = 0;
            foreach (var result in quizzesResults)
            {
                List<Quizzesanswer> questionAnswers = QuizzesAnswersLogic.Select(m => m.Idquestion == result.Idquestion && m.Idquiz == result.Idquiz).ToList();
                Quizzesquestion? quizQuestion = QuizzesQuestionsLogic.Select(m => m.Idquiz == result.Idquiz && m.Id == result.Idquestion).FirstOrDefault();

                double score = 0;
                List<Quizzesanswer> correctAnswers = questionAnswers
                    .Where(answer => answer.Iscorrect == 1)
                    .ToList();

                if (quizQuestion != null && quizQuestion.Type == 0)
                {
                    if (correctAnswers.Any(answer => answer.Id == result.Idquizzesanswer))
                    {
                        double answerScore = questionAnswers.Find(m => m.Idquestion == quizQuestion.Id).Totalscore;
                        score = answerScore;
                        totalScore += answerScore;
                    }
                }
                else
                {
                    bool shouldGiveScore = true;

                    var allQuestionsSelectedByUser = quizzesResults.FindAll(m => m.Idquestion == result.Idquestion).ToList();

                    foreach (var userQuestion in allQuestionsSelectedByUser)
                    {
                        var userSelectedAnswers = quizzesResults
                            .Where(m => m.Idquestion == userQuestion.Idquestion && m.Idquiz == result.Idquiz)
                            .Select(m => m.Idquizzesanswer)
                            .ToList();

                        var isAnyIncorrectSelected = userSelectedAnswers.Any(answerId =>
                            questionAnswers.Any(correctAnswer => correctAnswer.Id == answerId && correctAnswer.Iscorrect != 1)
                        );

                        if (isAnyIncorrectSelected)
                        {
                            shouldGiveScore = false;
                            break;
                        }
                    }

                    if (!shouldGiveScore)
                    {
                        score = 0;
                    }
                    else
                    {
                        double answerScore = questionAnswers.Find(m => m.Idquestion == quizQuestion.Id).Totalscore;
                        score = answerScore;
                        totalScore += answerScore;
                    }
                }

                Quizzesresult quizzesQuestionModelDto = new Quizzesresult()
                {
                    Idquiz = result.Idquiz,
                    Answer = result.Answer,
                    Elapsedtime = result.Elapsedtime,
                    Idquizzesanswer = result.Id,
                    Idaccount = result.Idaccount,
                    Score = score,
                    Idquizzesattempt = quizAttempt.Id
                };

                QuizzesResultsLogic.Insert(quizzesQuestionModelDto);
            }

            quizAttempt.Totalparticipantscore = totalScore;

            Quizzesattempt finalQuizAttempt = QuizzesAttemptsLogic.Update(quizAttempt);

            var quiz = QuizLogic.Select(x => x.Id == finalQuizAttempt.Idquiz).FirstOrDefault();

            var accountSkill = AccounttechnicalskillLogic.Select(x => x.Name.ToLower() == quiz.Technology.ToLower() && x.Idaccount == quizAttempt.Idaccount).FirstOrDefault();

            if (accountSkill != null)
            {
                accountSkill.Progress += quizAttempt.Totalparticipantscore / 100;
                if (accountSkill.Progress >= 1)
                {
                    accountSkill.Progress = 1;
                }
                AccounttechnicalskillLogic.Update(accountSkill);
            }
            else
            {
                double score = quizAttempt.Totalparticipantscore.Value / 100.00;
                AccounttechnicalskillLogic.Insert(new Xerion.Database.Persistence.Models.Accounttechnicalskill()
                {
                    Idaccount = quizAttempt.Idaccount,
                    Name = quiz.Technology,
                    Type = quiz.Type,
                    Progress = score >= 1 ? 1 : score
                });
            }

            return new ReturnedResponse<int>(finalQuizAttempt.Id, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public ReturnedResponse<QuizResultDto> GetResults(int quizAttemptId, int idAccount)
        {
            Quizzesattempt quizAttempt = QuizzesAttemptsLogic.Select(m => m.Id == quizAttemptId).FirstOrDefault();

            if (quizAttempt == null)
            {
                return new ReturnedResponse<QuizResultDto>(null, I18nTranslationDep.Translation(I18nTags.Error), false, ErrorCodes.NoData);
            }

            Quiz quiz = QuizLogic.Select(m => m.Id == quizAttempt.Idquiz).FirstOrDefault();

            if (quiz == null)
            {

            }

            QuizResultDto result = new QuizResultDto()
            {
                Quiz = quiz,
                QuizAttempt = quizAttempt
            };

            return new ReturnedResponse<QuizResultDto>(result, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public ReturnedResponse<List<QuizAttemptsDto>> GetAllResultsForJobAdvertisements(int jobOfferId)
        {
            var noData = new ReturnedResponse<List<QuizAttemptsDto>>(null, I18nTranslationDep.Translation(I18nTags.Error), false, ErrorCodes.NoData);
            
            var job = JobAdvertisementLogic.Select(m => m.Id == jobOfferId).FirstOrDefault();
            if (job == null) return noData;

            var quiz = QuizLogic.Select(m => m.Id == job.Quizid).FirstOrDefault();
            if (quiz == null) return noData;

            var quizzesAttempts = QuizzesAttemptsLogic.Select(m => m.Idquiz == job.Quizid).ToList();
            //if (quizzesAttempts.Count() == 0) return noData;

            var results = new List<QuizAttemptsDto>();
            foreach (var attempt in quizzesAttempts)
            {
                var account = AccountLogic.Select(m => m.Id == attempt.Idaccount).FirstOrDefault();
                if (account == null)
                {
                    account = new Xerion.Database.Persistence.Models.Account();
                }
                var result = new QuizAttemptsDto()
                {
                    Account = new AccountModelDto()
                    {
                        Id = account.Id,
                        Email = account.Email,
                        Title = account.Title,
                        Name = account.Name,
                        Surname = account.Surname,
                        Phonenumber = account.Phonenumber,
                        Description = account.Description,
                        Birthdate = account.Birthdate,
                        Verificationcode = account.Verificationcode,
                        Verificationcodevalid = account.Verificationcodevalid,
                        Idrole = account.Idrole,
                        Emailconfirmed = account.Emailconfirmed,
                        Allowsnotifications = account.Allowsnotifications,
                        Image = account.Image,
                        Refreshtoken = account.Refreshtoken,
                        Refreshtokenvalid = account.Refreshtokenvalid,
                        Createdat = account.Createdat,
                        Lastmodificationdate = account.Lastmodificationdate,
                        Salarymin = account.Salarymin,
                        Salarymax = account.Salarymax,
                        Location = account.Location,
                        Employmentmethod = account.Employmentmethod,
                        Employmenttype = account.Employmenttype
                    },
                    Quiz = quiz,
                        QuizAttempt = attempt
                    };

                results.Add(result);
            }

            return new ReturnedResponse<List<QuizAttemptsDto>>(results, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        public ReturnedResponse<int> DeleteQuizById(int id)
        {
            var quiz = QuizLogic.Select(m => m.Id == id).FirstOrDefault();
            var jobOffer = JobAdvertisementLogic.Select(x => x.Quizid == id).FirstOrDefault();
            if (quiz == null || jobOffer == null)
            {
                return new ReturnedResponse<int>(0, I18nTranslationDep.Translation(I18nTags.Error), false, ErrorCodes.AccountNotFound);
            }
            jobOffer.Quizid = 0;

            var updatedJobOffer = JobAdvertisementLogic.Update(jobOffer);

            quiz.Idcompany = 0;

            var updatedQuiz = QuizLogic.Update(quiz);


            //int result = 0;
            //result += QuizzesAnswersLogic.Delete(x => x.Idquiz == id);
            //result += QuizzesQuestionsLogic.Delete(x => x.Idquiz == id);
            //result += QuizzesResultsLogic.Delete(x => x.Idquiz == id);
            //result += QuizLogic.Delete(m => m.Id == id);

            if (updatedQuiz == null)
            {
                return new ReturnedResponse<int>(0, I18nTranslationDep.Translation(I18nTags.Error), false, ErrorCodes.AccountNotFound);
            }

            if (updatedJobOffer == null)
            {
                return new ReturnedResponse<int>(-1, I18nTranslationDep.Translation(I18nTags.Error), false, ErrorCodes.AccountNotFound);
            }

            return new ReturnedResponse<int>(1, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }
    }
}
