using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using Intotech.Common;
using Intotech.Common.Bll.Interfaces.ComplexResponses;
using Intotech.Common.Interfaces;
using Intotech.Xerion.Bll.Interfaces.Accounts;
using Intotech.Xerion.Bll.Models.Accounts;
using Intotech.Xerion.Bll.Models.ModelDtos.Intotech.Xerion.Dtos;
using Intotech.Xerion.Bll.Models.Security;
using Intotech.Xerion.Bll.Persistence;
using Intotech.Xerion.Bll.Persistence.Http;
using Intotech.Xerion.Bll.Persistence.Interfaces;
using Intotech.Xerion.Bll.Persistence.Interfaces.CompleteDto;
using Intotech.Xerion.Common;
using Intotech.Xerion.Common.Emails;
using Intotech.Xerion.Common.I18n;
using Intotech.Xerion.Common.Interfaces;
using Intotech.Xerion.Common.Interfaces.Emails;
using Intotech.Xerion.Common.Logging;
using Intotech.Xerion.Companies.Database.Persistence.Models;
using Intotech.Xerion.Database.Persistence.Models;
using Microsoft.IdentityModel.Tokens;

namespace Intotech.Xerion.Bll.Accounts;

public class AccountService : LoggerServiceBase, IAccountService
{
    private readonly AuthenticationSettings _authenticationSettings;
    protected IAccountLogic AccLogic;
    protected IAccountcoursescertificateLogic AccountcoursescertificateLogic;
    protected IAccountsoftskillLogic AccountSoftskillLogic;
    protected IAccountworkexperienceLogic AccountWorkexperienceLogic;
    protected IAccounttagLogic AccountTagLogic;
    protected IAccounttechnicalskillLogic AccountTechnicalSkillLogic;
    protected IAccountworkresponsibilityLogic AccountWorkResponsibilityLogic;
    protected IAccountsocialmedialinkLogic AccountSocialMediaLinkLogic;
    protected IAccounteducationLogic AccountEducationLogic;

    protected IAccountRoleLogic AccRoleLogic;
    protected IResetpasswordLogic ResetpasswordLogic;
    protected IEmailManager EmailManager = new EmailManager("pl");
    protected IFailedloginattemptLogic FailedloginattemptLogic;
    //protected IAccountmodeLogic AccountmodeLogic;
    //protected IPushtokenLogic PushtokenLogic;
    //protected IAccountChatLogic AccountChatLogic;

    public const int MinutesVerificationCodeValid = 15;

    public const int WhiteMode = 1;
    public const int DarkMode = 2;

    public const int RegistrationBadVerificationCodeKind = 1;
    public const int LoginBadVerificationCodeKind = 2;
    public const int LoginBadPassword = 3;
    public const int LoginEmailNotVerifiedPasswdMatch = 4;
    public const int LoginEmailNotVerifiedPasswdDontMatch = 5;

    public AccountService(
        AuthenticationSettings authenticationSettings, IAccountLogic accLogic, IAccountRoleLogic accRoleLogic,
        IResetpasswordLogic resetpasswordLogic, IFailedloginattemptLogic failedloginattemptLogic,
        IAccountcoursescertificateLogic accountcoursescertificateLogic,
        IAccountsoftskillLogic accountSoftskillLogic, IAccountworkexperienceLogic accountWorkexperienceLogic,
        IAccounttagLogic accountTagLogic, IAccounttechnicalskillLogic accountTechnicalSkillLogic,
        IAccountworkresponsibilityLogic accountWorkResponsibilityLogic,
        IAccountsocialmedialinkLogic accountSocialMediaLinkLogic, IAccounteducationLogic accountEducationLogic,
        ITranslationEngineI18n translationEngineI18n)
        : base(translationEngineI18n)
    {
        _authenticationSettings = authenticationSettings;
        AccLogic = accLogic;
        AccRoleLogic = accRoleLogic;
        ResetpasswordLogic = resetpasswordLogic;
        //AccountmodeLogic = accountmodeLogic;
        FailedloginattemptLogic = failedloginattemptLogic;
        //PushtokenLogic = pushtokenLogic;
        //AccountChatLogic = chatLogic;
        AccountcoursescertificateLogic = accountcoursescertificateLogic;
        AccountSoftskillLogic = accountSoftskillLogic;
        AccountWorkexperienceLogic = accountWorkexperienceLogic;
        AccountTagLogic = accountTagLogic;
        AccountTechnicalSkillLogic = accountTechnicalSkillLogic;
        AccountWorkResponsibilityLogic = accountWorkResponsibilityLogic;
        AccountSocialMediaLinkLogic = accountSocialMediaLinkLogic;
        AccountEducationLogic = accountEducationLogic;
    }

    public ReturnedResponse<AccountRoleDto> GlfLogin(Accountrole accountrole)
    {
        AccountRoleDto result = GenerateJwt(accountrole);

        return new ReturnedResponse<AccountRoleDto>(result, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
    }

    public ReturnedResponse<AccountRoleDto> Login(LoginDto loginDto)
    {
        Accountrole simpleaccount = AccRoleLogic.Select(m => m.Email == loginDto.Email && m.Password == loginDto.Password).FirstOrDefault();

        if (simpleaccount == null)
        {
            Accountrole emailAccount = AccRoleLogic.Select(m => m.Email == loginDto.Email).FirstOrDefault();

            if (emailAccount != null)
            {
                ReturnedResponse<AccountRoleDto> isHackResult = IsHack<AccountRoleDto>(emailAccount.Id.Value, LoginBadPassword);

                if (isHackResult.ErrorCode == ErrorCodes.UnderAttack)
                {
                    return isHackResult;
                }
            }

            return new ReturnedResponse<AccountRoleDto>(null, I18nTranslationDep.Translation(I18nTags.AccountNotFound), false, ErrorCodes.AccountNotFound);
        }

        if (!simpleaccount.Emailconfirmed.Value && simpleaccount.Password == loginDto.Password)
        {
            ReturnedResponse<AccountRoleDto> isHackResult = IsHack<AccountRoleDto>(simpleaccount.Id.Value, LoginEmailNotVerifiedPasswdMatch);

            if (isHackResult.ErrorCode == ErrorCodes.UnderAttack)
            {
                ResendEmailVerificationCode(simpleaccount.Id.Value);

                return isHackResult;
            }

            return new ReturnedResponse<AccountRoleDto>(null, I18nTranslationDep.Translation(I18nTags.EmailIsNotConfirmed), false, ErrorCodes.EmailIsNotConfirmed);
        }

        if (!simpleaccount.Emailconfirmed.Value)
        {
            return new ReturnedResponse<AccountRoleDto>(null, I18nTranslationDep.Translation(I18nTags.EmailIsNotConfirmed), false, ErrorCodes.EmailIsNotConfirmedPassMatch);
        }


        string refreshToken = simpleaccount.Refreshtoken;

        if (simpleaccount.Refreshtokenvalid == null || simpleaccount.Refreshtokenvalid < DateTime.Now)
        {
            Account accToRefreshToken = AccLogic.Select(m => m.Id == simpleaccount.Id).First();

            accToRefreshToken.Refreshtokenvalid = DateTime.Now.AddDays(AccountLogicConstants.RefreshTokenValidDays);
            refreshToken = accToRefreshToken.Refreshtoken = StringUtils.GetRandomString(AccountLogicConstants.RefreshTokenMaxLength);

            AccLogic.Update(accToRefreshToken);
        }

        AccountRoleDto resultAccRole = GenerateJwt(new LoginDto() { Email = simpleaccount.Email, Password = simpleaccount.Password });

        resultAccRole.Refreshtoken = refreshToken;

        return new ReturnedResponse<AccountRoleDto>(resultAccRole, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
    }

    public virtual ReturnedResponse<AccountRoleDto> Register(AccountRegisterDto sAccount)
    {
        if (!StringUtils.IsEmailAddress(sAccount.Email))
        {
            return new ReturnedResponse<AccountRoleDto>(null, I18nTranslationDep.Translation(I18nTags.WrongData), false, ErrorCodes.DataIntegrityViolated);
        }

        Account simpleaccount = AccLogic.Select(m => m.Email == sAccount.Email).FirstOrDefault();

        if (simpleaccount != null)
        {
            if (!simpleaccount.Emailconfirmed.Value && simpleaccount.Password == sAccount.Password)
            {
                ResendEmailVerificationCode(simpleaccount.Id);

                return new ReturnedResponse<AccountRoleDto>(null, I18nTranslationDep.Translation(I18nTags.PleaseConfirmYourXerionAccountRegistration), false, ErrorCodes.PleaseConfirmEmail);
            }

            if (simpleaccount.Emailconfirmed.Value && simpleaccount.Password == sAccount.Password)
            {
                //login from registration - all data ok
                return new ReturnedResponse<AccountRoleDto>(Login(new LoginDto() { Email = sAccount.Email, Password = sAccount.Password }).MethodResult, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.LoggedInViaRegistration);
            }

            if (!simpleaccount.Emailconfirmed.Value)
            {
                // pass  do not match, email is not verified
                ReturnedResponse<AccountRoleDto> isHackRes = IsHack<AccountRoleDto>(simpleaccount.Id, LoginEmailNotVerifiedPasswdDontMatch);

                if (!isHackRes.IsSuccess)
                {
                    return isHackRes;
                }

                ResendEmailVerificationCode(simpleaccount.Id);

                return new ReturnedResponse<AccountRoleDto>(null, I18nTranslationDep.Translation(I18nTags.PleaseConfirmYourXerionAccountRegistration), false, ErrorCodes.PleaseConfirmEmail);
            }

            return new ReturnedResponse<AccountRoleDto>(null, I18nTranslationDep.Translation(I18nTags.AccountExists), false, ErrorCodes.AccountExists);
        }

        Account account = new Account()
        {
            Name = sAccount.FirstName,
            Surname = sAccount.LastName,
            Password = sAccount.Password,
            Email = sAccount.Email
        };

        account.Verificationcode = IntUtils.GetRandomCode(1000, 9999);
        account.Verificationcodevalid = DateTime.Now.AddMinutes(MinutesVerificationCodeValid);

        simpleaccount = AccLogic.Insert(account);

        //if (account.Iscompany.Value)
        //{
        //    XerionHttpClientProxy client = new XerionHttpClientProxy();
        //    ReturnedResponse<AccountCompleteDto> response = client.ApiRegisterCompany(company);
        //}

        EmailManager.SendEmailVerificationCode(account.Email, account.Name, simpleaccount.Verificationcode.Value.ToString());

        simpleaccount.Verificationcode = 0;

        return new ReturnedResponse<AccountRoleDto>(null, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
    }

    public virtual ReturnedResponse<AccountRoleDto> ConfirmEmail(EmailConfirmDto EcDto)
    {
        Account account = AccLogic.Select(m => m.Email == EcDto.Email).FirstOrDefault();

        if (account == null)
        {
            return new ReturnedResponse<AccountRoleDto>(null, I18nTranslationDep.Translation(I18nTags.FailVerifyingAccount), false, ErrorCodes.FailVerifyingAccount);
        }
        
        if (account.Verificationcode != EcDto.Code)
        {
            return IsHack<AccountRoleDto>(account.Id, RegistrationBadVerificationCodeKind);
        }
        
        account.Emailconfirmed = true;
        string refreshToken = account.Refreshtoken =
            StringUtils.GetRandomString(AccountLogicConstants.RefreshTokenMaxLength);
        account.Refreshtokenvalid = DateTime.Now.AddDays(AccountLogicConstants.RefreshTokenValidDays);

        AccLogic.Update(account);

        AccountRoleDto accountRoleDto = GenerateJwt(new LoginDto()
        { Email = account.Email, Password = account.Password });

        accountRoleDto.Refreshtoken = refreshToken;

        return new ReturnedResponse<AccountRoleDto>(accountRoleDto,
            I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
    }

    public virtual ReturnedResponse<Account> ChangeRole(Account account)
    {
        Account prevAccount = AccLogic.Select(m => m.Email == account.Email).FirstOrDefault();

        if (prevAccount == null)
        {
            return new ReturnedResponse<Account>(null, I18nTranslationDep.Translation(I18nTags.FailVerifyingAccount), false, ErrorCodes.FailVerifyingAccount);
        }

        Account newAccount = AccLogic.Update(account);

        return new ReturnedResponse<Account>(newAccount, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
    }

    public virtual ReturnedResponse<GetAccountCompleteDto> GetAccountById(int accountId)
    {
        Account? account = AccLogic.Select(m => m.Id == accountId).FirstOrDefault();

        List<Accountcoursescertificate> accountCoursesCertificates = AccountcoursescertificateLogic.Select(m => m.Idaccount == accountId).ToList();
        List<Accountsoftskill> accountSoftSkills = AccountSoftskillLogic.Select(m => m.Idaccount == accountId).ToList();
        List<Accountworkexperience> accountWorkExperiences = AccountWorkexperienceLogic.Select(m => m.Idaccount == accountId).ToList();
        List<Accounttag> accountTags = AccountTagLogic.Select(m => m.Idaccount == accountId).ToList();
        List<Accounttechnicalskill> accountTechnicalSkills = AccountTechnicalSkillLogic.Select(m => m.Idaccount == accountId).ToList();
        List<Accountworkresponsibility> accountWorkResponsibilities = AccountWorkResponsibilityLogic.Select(m => m.Idaccount == accountId).ToList();
        List<Accountsocialmedialink> accountSocialMediaLinks = AccountSocialMediaLinkLogic.Select(m => m.Idaccount == accountId).ToList();
        List<Accounteducation> accountEducations = AccountEducationLogic.Select(m => m.Idaccount == accountId).ToList();

        if (account == null)
        {
            return new ReturnedResponse<GetAccountCompleteDto>(null, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        AccountModelDto accountModelDto = new AccountModelDto()
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
        };

        GetAccountCompleteDto accountComplete = new GetAccountCompleteDto()
        {
            Account = account,
            AccountCoursesCertificates = accountCoursesCertificates,
            AccountSoftSkills = accountSoftSkills,
            AccountWorkExperiences = accountWorkExperiences,
            AccountTags = accountTags,
            AccountTechnicalSkills = accountTechnicalSkills,
            AccountWorkResponsibilities = accountWorkResponsibilities,
            accountEducationModelDto = accountEducations,
            AccountSocialMediaLinks = accountSocialMediaLinks
        };

        return new ReturnedResponse<GetAccountCompleteDto>(accountComplete, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
    }

    public virtual ReturnedResponse<AccountCompleteDto> UpdateAccountById(AccountCompleteDto account)
    {

        if (account.Account == null)
        {
            return new ReturnedResponse<AccountCompleteDto>(null, I18nTranslationDep.Translation(I18nTags.AccountNotFound), false, ErrorCodes.AccountNotFound);
        }

        List<Accountcoursescertificate> certificatesCollection = new List<Accountcoursescertificate>();
        if (account.AccountCoursesCertificates == null || account.AccountCoursesCertificates.Count() == 0)
        {
            certificatesCollection = AccountcoursescertificateLogic.Select(x => account.Account.Id == x.Idaccount).ToList();
        }
        else
        {
            certificatesCollection = AccountcoursescertificateLogic.Select(x => account.AccountCoursesCertificates[0].Idaccount == x.Idaccount).ToList();
        }
        certificatesCollection.ForEach(item => AccountcoursescertificateLogic.Delete(item));
        foreach (var certificate in account.AccountCoursesCertificates)
        {
            Accountcoursescertificate certificateModelDto = new Accountcoursescertificate()
            {
                Idcertificate = certificate.Idcertificate,
                Certificatenumber = certificate.Certificatenumber,
                Idaccount = certificate.Idaccount,
                Idorganizationissuingcertificate = certificate.Idorganizationissuingcertificate,
                Certificateissuedate = certificate.Certificateissuedate,
                Expirationdate = certificate.Expirationdate,
                Certificatename = certificate.Certificatename,
                Organizationissuingcertificate = certificate.Organizationissuingcertificate,
                Createdat = certificate.Createdat
            };

            AccountcoursescertificateLogic.Update(certificateModelDto);
        }

        List<Accountsoftskill> softSkillsCollection = new List<Accountsoftskill>();
        if (account.AccountSoftSkills == null || account.AccountSoftSkills.Count() == 0)
        {
            softSkillsCollection = AccountSoftskillLogic.Select(x => account.Account.Id == x.Idaccount).ToList();
        }
        else
        {
            softSkillsCollection = AccountSoftskillLogic.Select(x => account.AccountSoftSkills[0].Idaccount == x.Idaccount).ToList();
        }
        softSkillsCollection.ForEach(item => AccountSoftskillLogic.Delete(item));
        foreach (var softSkill in account.AccountSoftSkills)
        {
            Accountsoftskill accountsoftskill = new Accountsoftskill()
            {
                Idaccountsoftskillstitle = softSkill.Idaccountsoftskillstitle,
                Name = softSkill.Name,
                Idaccount = softSkill.Idaccount,
                Createdat = softSkill.Createdat,
            };

            AccountSoftskillLogic.Update(accountsoftskill);
        }
        

        List<Accountworkexperience> workExperiencesCollection = new List<Accountworkexperience>();
        if (account.AccountWorkExperiences.Count() == 0)
        {
            workExperiencesCollection = AccountWorkexperienceLogic.Select(x => account.Account.Id == x.Idaccount).ToList();
        }
        else
        {
            workExperiencesCollection = AccountWorkexperienceLogic.Select(x => account.AccountWorkExperiences[0].Idaccount == x.Idaccount).ToList();
        }
       
        
        workExperiencesCollection.ForEach(item => {
            var responsibilites = AccountWorkResponsibilityLogic.Select(x => x.Idaccount == item.Idaccount).ToList();
            responsibilites.ForEach(responsibility => { AccountWorkResponsibilityLogic.Delete(responsibility); });
                AccountWorkexperienceLogic.Delete(item);
            });
        foreach (var workExperience in account.AccountWorkExperiences)
        {
            var dateend = workExperience.Dateend != null ? XerionUtils.ParseDateTime(workExperience.Dateend.Value) : workExperience.Dateend;

            Accountworkexperience accountworkexperience = new Accountworkexperience()
            {
                Idprofession = workExperience.Idprofession,
                Idworkcompany = workExperience.Idworkcompany,
                Idaccount = workExperience.Idaccount,
                Datestart = XerionUtils.ParseDateTime(workExperience.Datestart).Value,
                Dateend = dateend,
                Workcompany = workExperience.Workcompany,
                Profession = workExperience.Profession,
                Createdat = XerionUtils.ParseDateTime(workExperience.Createdat),
            };

            AccountWorkexperienceLogic.Update(accountworkexperience);
        }

        List<Accounttag> tagsCollection = new List<Accounttag>();
        if (account.AccountTags.Count() == 0)
        {
            tagsCollection = AccountTagLogic.Select(x => account.Account.Id == x.Idaccount).ToList();
        }
        else
        {
            tagsCollection = AccountTagLogic.Select(x => account.AccountTags[0].Idaccount == x.Idaccount).ToList();
        }
        tagsCollection.ForEach(item => AccountTagLogic.Delete(item));
        foreach (var tag in account.AccountTags)
        {
            Accounttag accounttag = new Accounttag()
            {
                Info = tag.Info,
                Idtag = tag.Idtag,
                Idaccount = tag.Idaccount,
                Createdat = tag.Createdat,
            };

            AccountTagLogic.Update(accounttag);
        }

        List<Accounttechnicalskill> technicalSkillsCollection = new List<Accounttechnicalskill>();
        if (account.AccountTechnicalSkills.Count() == 0)
        {
            technicalSkillsCollection = AccountTechnicalSkillLogic.Select(x => account.Account.Id == x.Idaccount).ToList();
        }
        else
        {
            technicalSkillsCollection = AccountTechnicalSkillLogic.Select(x => account.AccountTechnicalSkills[0].Idaccount == x.Idaccount).ToList();
        }
        technicalSkillsCollection.ForEach(item => AccountTechnicalSkillLogic.Delete(item));
        foreach (var technicalSkill in account.AccountTechnicalSkills)
        {
            Accounttechnicalskill accounttechnicalskill = new Accounttechnicalskill()
            {
                Name = technicalSkill.Name,
                Progress = technicalSkill.Progress,
                Idaccount = technicalSkill.Idaccount,
                Type = technicalSkill.Type,
            };

            AccountTechnicalSkillLogic.Update(accounttechnicalskill);
        }

        List<Accountworkresponsibility> workResponsibilitiesCollection = new List<Accountworkresponsibility>();
        if (account.AccountWorkResponsibilities.Count() == 0)
        {
            workResponsibilitiesCollection = AccountWorkResponsibilityLogic.Select(x => account.Account.Id == x.Idaccount).ToList();
        }
        else
        {
            workResponsibilitiesCollection = AccountWorkResponsibilityLogic.Select(x => account.AccountWorkResponsibilities[0].Idaccount == x.Idaccount).ToList();
        }
        workResponsibilitiesCollection.ForEach(item => AccountWorkResponsibilityLogic.Delete(item));
        foreach (var workResponsibility in account.AccountWorkResponsibilities)
        {
            Accountworkresponsibility accountworkresponsibility = new Accountworkresponsibility()
            {
                Name = workResponsibility.Name,
                Idaccount = workResponsibility.Idaccount,
                Idaccountworkexperience = workResponsibility.Idaccountworkexperience,
                Createdat = workResponsibility.Createdat,
            };

            AccountWorkResponsibilityLogic.Update(accountworkresponsibility);
        }


        List<Accountsocialmedialink> socialMediaLinksCollection = new List<Accountsocialmedialink>();
        if (account.AccountSocialMediaLinks.Count() == 0)
        {
            socialMediaLinksCollection = AccountSocialMediaLinkLogic.Select(x => account.Account.Id == x.Idaccount).ToList();
        }
        else
        {
            socialMediaLinksCollection = AccountSocialMediaLinkLogic.Select(x => account.AccountSocialMediaLinks[0].Idaccount == x.Idaccount).ToList();
        }
        socialMediaLinksCollection.ForEach(item => AccountSocialMediaLinkLogic.Delete(item));
        foreach (var socialMediaLink in account.AccountSocialMediaLinks)
        {
            Accountsocialmedialink accountsocialmedialink = new Accountsocialmedialink()
            {
                Idsocialmedialink = socialMediaLink.Idsocialmedialink.Value,
                Name = socialMediaLink.Name,
                Link = socialMediaLink.Link,
                Idaccount = socialMediaLink.Idaccount
            };

            AccountSocialMediaLinkLogic.Update(accountsocialmedialink);
        }

        List<Accounteducation> educationCollection = new List<Accounteducation>();
        if (account.AccountEducationModelDto.Count() == 0)
        {
            educationCollection = AccountEducationLogic.Select(x => account.Account.Id == x.Idaccount).ToList();
        }
        else
        {
            educationCollection = AccountEducationLogic.Select(x => account.AccountEducationModelDto[0].Idaccount == x.Idaccount).ToList();
        }
        educationCollection.ForEach(item => AccountEducationLogic.Delete(item));
        foreach (var education in account.AccountEducationModelDto)
        {
            Accounteducation accounteducation = new Accounteducation()
            {
                Idprofession = education.Idprofession,
                Iduniversityname = education.Iduniversityname,
                Idprofessionaltitle = education.Idprofessionaltitle,
                Idaccount = education.Idaccount,
                Datestart = education.Datestart,
                Dateend = education.Dateend,
                Professionname = education.Professionname,
                Universityname = education.Universityname,
                Professionaltitle = education.Professionaltitle,
                Createdat = education.Createdat,
            };

            AccountEducationLogic.Update(accounteducation);
        }

        
        Account currAccount = AccLogic.Select(m => m.Email == account.Account.Email).FirstOrDefault();
        if (currAccount != null)
        {
            Account accountModelDto = new Account()
            {
                Id = account.Account.Id,
                Title = account.Account.Title,
                Name = account.Account.Name,
                Surname = account.Account.Surname,
                Phonenumber = account.Account.Phonenumber,
                Description = account.Account.Description,
                Birthdate = account.Account.Birthdate,
                Verificationcode = account.Account.Verificationcode,
                Verificationcodevalid = account.Account.Verificationcodevalid,
                Idrole = account.Account.Idrole,
                Emailconfirmed = account.Account.Emailconfirmed,
                Allowsnotifications = account.Account.Allowsnotifications,
                Image = account.Account.Image,
                Refreshtoken = account.Account.Refreshtoken,
                Refreshtokenvalid = account.Account.Refreshtokenvalid,
                Createdat = account.Account.Createdat,
                Lastmodificationdate = account.Account.Lastmodificationdate,
                Salarymin = account.Account.Salarymin,
                Salarymax = account.Account.Salarymax,
                Location = account.Account.Location,
                Employmentmethod = account.Account.Employmentmethod,
                Employmenttype = account.Account.Employmenttype,
                Password = currAccount.Password,
                Email = currAccount.Email,
            };

            Account? updatedAccount = AccLogic.Update(accountModelDto);
        }

        return new ReturnedResponse<AccountCompleteDto>(account, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
    }

    public virtual ReturnedResponse<AccountRoleDto> AcceptResetPassword(ResetPasswordConfirmDto resetPasswordConfirmDto) // email, kod
    {
        Resetpassword resPwd = ResetpasswordLogic.Select(m => m.Email == resetPasswordConfirmDto.Email && m.Verificationcode == resetPasswordConfirmDto.Code).FirstOrDefault();

        if (resPwd == null)
        {
            return new ReturnedResponse<AccountRoleDto>(null, I18nTranslationDep.Translation(I18nTags.FailVerifyingAccount), false, ErrorCodes.FailVerifyingAccount);
        }

        Account account = AccLogic.Select(m => m.Email == resetPasswordConfirmDto.Email).FirstOrDefault();

        if (account == null)
        {
            return new ReturnedResponse<AccountRoleDto>(null, I18nTranslationDep.Translation(I18nTags.FailVerifyingAccount), false, ErrorCodes.FailVerifyingAccount);
        }

        account.Password = resetPasswordConfirmDto.Password;

        AccLogic.Update(account);

        return Login(new LoginDto() { Email = resetPasswordConfirmDto.Email, Password = resetPasswordConfirmDto.Password });
    }

    public virtual ReturnedResponse<int?> ForgotPassword(string email)
    {
        //check if email exists in accounts
        Account acc = AccLogic.Select(m => m.Email == email).FirstOrDefault();
        // if not return with significant error code

        if (acc == null)
        {
            return new ReturnedResponse<int?>(null, I18nTranslationDep.Translation(I18nTags.EmailDoesNotExist), false, ErrorCodes.EmailDoesNotExistResetPassword);
        }

        Resetpassword resetpassword = ResetpasswordLogic.Select(m => m.Email == email).FirstOrDefault();

        if (resetpassword != null)
        {
            resetpassword.Verificationcode = IntUtils.GetRandomCode(1000, 9999);

            ResetpasswordLogic.Update(resetpassword);

            EmailManager.SendPasswordResetVerificationCode(email, acc.Name, resetpassword.Verificationcode.ToString());

            return new ReturnedResponse<int?>(null, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        int verificationCode = IntUtils.GetRandomCode(1000, 9999);

        // if exists, generate a code and stor4e record with ResetpasswordLogic.Insert 
        resetpassword = new Resetpassword() { Email = email, Verificationcode = verificationCode };

        ResetpasswordLogic.Insert(resetpassword);

        //send Email 
        EmailManager.SendPasswordResetVerificationCode(email, acc.Name, verificationCode.ToString());

        return new ReturnedResponse<int?>(null, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
    }

    public ReturnedResponse<int?> ResetPasswordCheckCode(string email, string verificationCode)
    {
        Account acc = AccLogic.Select(m => m.Email == email).FirstOrDefault();
        // if not return with significant error code

        if (acc == null)
        {
            return new ReturnedResponse<int?>(null, I18nTranslationDep.Translation(I18nTags.EmailDoesNotExist), false, ErrorCodes.EmailDoesNotExistResetPassword);
        }

        Resetpassword resetpassword = ResetpasswordLogic.Select(m => m.Email == email && m.Verificationcode.ToString() == verificationCode).FirstOrDefault();

        if (resetpassword == null)
        {
            return new ReturnedResponse<int?>(null, I18nTranslationDep.Translation(I18nTags.FailVerifyingAccount), false, ErrorCodes.FailVerifyingAccount);
        }

        return new ReturnedResponse<int?>(null, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
    }

    public ReturnedResponse<int?> ResetPassword(string email, string password, string token)
    {
        Account acc = AccLogic.Select(m => m.Email == email).FirstOrDefault();
        // if not return with significant error code

        if (acc == null)
        {
            return new ReturnedResponse<int?>(null, I18nTranslationDep.Translation(I18nTags.EmailDoesNotExist), false, ErrorCodes.EmailDoesNotExistResetPassword);
        }

        Resetpassword resetpassword = ResetpasswordLogic.Select(m => m.Email == email && m.Verificationcode.ToString() == token).FirstOrDefault();

        if (resetpassword == null)
        {
            return new ReturnedResponse<int?>(null, I18nTranslationDep.Translation(I18nTags.FailVerifyingAccount), false, ErrorCodes.FailVerifyingAccount);
        }

        acc.Password = password;

        AccLogic.Update(acc);

        return new ReturnedResponse<int?>(null, I18nTranslationDep.Translation(I18nTags.PasswordChangeSuccess), true, ErrorCodes.Success);
    }

    public ReturnedResponse<TokensModelDto> CreateNewAccessToken(string accessToken, string refreshToken)
    {
        ClaimsPrincipal clPr = GetPrincipalFromExpiredToken(accessToken);

        string email = clPr.Claims.Where(claim => claim.Type == ClaimTypes.NameIdentifier).First().Value;

        Account account = AccLogic.Select(m => m.Email == email).FirstOrDefault();

        if (account == null)
        {
            ErrorHandler.LogDebug("Access token: " + accessToken + " and refresh token " + refreshToken + " CreateNewAccessToken call failed with account not found for the email " + email);

            return new ReturnedResponse<TokensModelDto>(null, I18nTranslationDep.Translation(I18nTags.AccountNotFound), false, ErrorCodes.AccountNotFound);
        }

        if (account.Refreshtoken != refreshToken)
        {
            ErrorHandler.LogDebug("Access token: " + accessToken + " and refresh token " + refreshToken + " CreateNewAccessToken call failed with invalid refresh token for the email " + email);

            return new ReturnedResponse<TokensModelDto>(null, I18nTranslationDep.Translation(I18nTags.ErrorPleaseLogInToApp), false, ErrorCodes.ErrorPleaseLogInToApp);
        }

        if (account.Refreshtokenvalid < DateTime.Now)
        {
            return new ReturnedResponse<TokensModelDto>(null, I18nTranslationDep.Translation(I18nTags.RefreshTokenExpiredPleaseLogIn), false, ErrorCodes.RefreshTokenExpiredPleaseLogIn);
        }

        TokensModelDto tokensModel = new TokensModelDto();

        tokensModel.AccessToken = GenerateJwt(new LoginDto() { Email = account.Email, Password = account.Password }).AccessToken;

        tokensModel.RefreshToken = account.Refreshtoken = StringUtils.GetRandomString(AccountLogicConstants.RefreshTokenMaxLength);

        AccLogic.Update(account);

        return new ReturnedResponse<TokensModelDto>(tokensModel, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
    }

    public ReturnedResponse<bool> SetAllowsNotifications(int accountId, bool allowsNotifications)
    {
        Account account = AccLogic.Select(m => m.Id == accountId).FirstOrDefault();

        if (account == null)
        {
            return new ReturnedResponse<bool>(false, I18nTranslationDep.Translation(I18nTags.AccountNotFound), false, ErrorCodes.AccountNotFound);
        }

        account.Allowsnotifications = allowsNotifications;

        AccLogic.Update(account);

        return new ReturnedResponse<bool>(allowsNotifications, I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
    }

    protected AccountRoleDto GenerateJwt(LoginDto user)
    {
        Accountrole userRole = AccRoleLogic.Select(x => x.Email == user.Email && x.Password == user.Password).FirstOrDefault();

        if (userRole is null)
        {
            //throw new Exception("Invalid username or password");
            //throw new BadRequestException("Invalid username or password");
            return null;
        }

        return GenerateJwt(userRole);
    }
    protected AccountRoleDto GenerateJwt(Accountrole userRole)
    {
        AccountRoleDto userArd = DtoModelMapper.Map<AccountRoleDto, Accountrole>(userRole);

        List<Claim> claims = new List<Claim>()
            {
                new Claim(ClaimTypes.NameIdentifier, userArd.Email),
                new Claim(ClaimTypes.Name, $"{userArd.Name} {userArd.Surname}"),
                new Claim(ClaimTypes.Role, $"{userArd.Rolename}"),
            };

        SymmetricSecurityKey key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_authenticationSettings.JwtKey));
        SigningCredentials cred = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
        DateTime expires = DateTime.Now.AddDays(_authenticationSettings.JwtExpireDays);

        JwtSecurityToken token = new JwtSecurityToken(_authenticationSettings.JwtIssuer,
            _authenticationSettings.JwtIssuer, claims, expires: expires, signingCredentials: cred);

        JwtSecurityTokenHandler tokenHandler = new JwtSecurityTokenHandler();

        userArd.AccessToken = tokenHandler.WriteToken(token);

        //AccountChatLogic.Insert(new Chat.Database.Persistence.Models.Accountchat()
        //{
        //    Firstname = userArd.FirstName,
        //    Lastname = userArd.LastName,
        //    Idaccount = userArd.Id.Value,
        //    Memberemail = userArd.Email,
        //    Hasmanyaccount = true // TODO linia 427 lista?
        //});

        return userArd;
    }

    protected ClaimsPrincipal GetPrincipalFromExpiredToken(string token)
    {
        var tokenValidationParameters = new TokenValidationParameters
        {
            ValidateAudience = false,
            ValidateIssuer = false,
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_authenticationSettings.JwtKey)),
            ValidateLifetime = false
        };
        var tokenHandler = new JwtSecurityTokenHandler();
        SecurityToken securityToken;
        
        var principal = tokenHandler.ValidateToken(token, tokenValidationParameters, out securityToken);
        var jwtSecurityToken = securityToken as JwtSecurityToken;
        if (jwtSecurityToken == null || !jwtSecurityToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256, StringComparison.InvariantCultureIgnoreCase))
            throw new SecurityTokenException("Invalid token");

        return principal;
    }

    public virtual ReturnedResponse<bool> ResendEmailVerificationCode(string email)
    {
        Account accToRefreshCode = AccLogic.Select(m => m.Email == email).FirstOrDefault();

        if (accToRefreshCode != null)
        {
            ErrorLogger.Log("ResendEmailVerificationCode " + accToRefreshCode.Id + " code " + accToRefreshCode.Verificationcode, LogLevels.Debug, accToRefreshCode);
            //ErrorLogger.Log("ResendEmailVerificationCode " + accToRefreshCode.Id + " code " + accToRefreshCode.Verificationcode, LogLevels.Debug);

            return new ReturnedResponse<bool>(ResendEmailVerificationCode(accToRefreshCode.Id), I18nTranslationDep.Translation(I18nTags.Success), true, ErrorCodes.Success);
        }

        return new ReturnedResponse<bool>(false, I18nTranslationDep.Translation(I18nTags.WrongData), false, ErrorCodes.DataIntegrityViolated); ;
    }

    protected virtual ReturnedResponse<TResponse> IsHack<TResponse>(int accountId, int kind)
    {
        FailedloginattemptLogic.Insert(new Failedloginattempt() { Idaccount = accountId, Kind = kind });

        bool isHack = false;

        isHack = FailedloginattemptLogic.Select(m => m.Idaccount == accountId && m.Kind == kind && m.Createdat > DateTime.Now.AddMinutes(-5)).Count() > 5;

        if (isHack)
        {
            return new ReturnedResponse<TResponse>(default(TResponse), I18nTranslationDep.Translation(I18nTags.UnderAttack), false, ErrorCodes.UnderAttack);
        }

        return new ReturnedResponse<TResponse>(default(TResponse), I18nTranslationDep.Translation(I18nTags.WrongData), false, ErrorCodes.DataIntegrityViolated);
    }

    protected virtual bool ResendEmailVerificationCode(int accountId)
    {
        Account accToRefreshCode = AccLogic.Select(m => m.Id == accountId).First();

        if (accToRefreshCode.Verificationcodevalid < DateTime.Now)
        {
            accToRefreshCode.Verificationcode = IntUtils.GetRandomCode(1000, 9999);
            accToRefreshCode.Verificationcodevalid = DateTime.Now.AddMinutes(MinutesVerificationCodeValid);

            accToRefreshCode = AccLogic.Update(accToRefreshCode);

            EmailManager.SendEmailVerificationCode(accToRefreshCode.Email, accToRefreshCode.Name, accToRefreshCode.Verificationcode.Value.ToString());
        }

        return true;
    }
}