using System.Text;
using System.Text.Json;
using Intotech.Common;
using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Database.DbSetup;
using Intotech.Common.Interfaces;
using Intotech.Xerion.Bll.Accounts;
using Intotech.Xerion.Bll.Interfaces.Accounts;
using Intotech.Xerion.Bll.Models.Accounts;
using Intotech.Xerion.Bll.Models.Security;
using Intotech.Xerion.Bll.Persistence;
using Intotech.Xerion.Bll.Persistence.Interfaces;
using Intotech.Xerion.Common.I18n;
using Intotech.Xerion.Common.Seed.Xerion.Main;
using Microsoft.IdentityModel.Tokens;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddControllers();
builder.Services.AddCors(x => x.AddPolicy("AllowOrigin", options => options.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader())); //Angular Localhost

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<AuthenticationSettings, AuthenticationSettings>();
builder.Services.AddScoped<ITranslationEngineI18n, XerionTranslationEngineI18n>();
builder.Services.AddScoped<IUserExtraDataLogic, UserExtraDataLogic>();
builder.Services.AddScoped<IAccountRoleLogic, AccountRoleLogic>();
builder.Services.AddScoped<IAccountLogic, AccountLogic>();
builder.Services.AddScoped<IGlfManager, GlfManager>();
builder.Services.AddScoped<GlfServiceBase<FacebookUserDto>, FacebookUserService>();
builder.Services.AddScoped<GlfServiceBase<GoogleUserDto>, GoogleUserService>();
builder.Services.AddScoped<IResetpasswordLogic, ResetpasswordLogic>();
builder.Services.AddScoped<IAccountService, AccountService>();
builder.Services.AddScoped<IFailedloginattemptLogic, FailedloginattemptLogic>();
builder.Services.AddScoped<IAccountLogic, AccountLogic>();
builder.Services.AddScoped<IAccountcoursescertificateLogic, AccountcoursescertificateLogic>();
builder.Services.AddScoped<IAccounteducationLogic, AccounteducationLogic>();
builder.Services.AddScoped<IAccountforeignlanguageLogic, AccountforeignlanguageLogic>();
builder.Services.AddScoped<IAccountsoftskillLogic, AccountsoftskillLogic>();
builder.Services.AddScoped<IAccountworkexperienceLogic, AccountworkexperienceLogic>();
builder.Services.AddScoped<IAccountworkresponsibilityLogic, AccountworkresponsibilityLogic>();
builder.Services.AddScoped<IEmailsregisterLogic, EmailsregisterLogic>();
builder.Services.AddScoped<IEmploymenttypeLogic, EmploymenttypeLogic>();
builder.Services.AddScoped<IFailedloginattemptLogic, FailedloginattemptLogic>();
builder.Services.AddScoped<IPushtokenLogic, PushtokenLogic>();
builder.Services.AddScoped<IResetpasswordLogic, ResetpasswordLogic>();
builder.Services.AddScoped<IRoleLogic, RoleLogic>();
builder.Services.AddScoped<IUserextradatumLogic, UserextradatumLogic>();
builder.Services.AddScoped<IAccounttagLogic, AccounttagLogic>();
builder.Services.AddScoped<IAccounttechnicalskillLogic, AccounttechnicalskillLogic>();
builder.Services.AddScoped<IAccountsocialmedialinkLogic, AccountsocialmedialinkLogic>();


builder.Services.AddHttpContextAccessor();

AuthenticationSettings authenticationSettings = new AuthenticationSettings();

builder.Services.AddSingleton(authenticationSettings);

builder.Services.AddAuthentication(option =>
{
    option.DefaultAuthenticateScheme = "Bearer";
    option.DefaultScheme = "Bearer";
    option.DefaultChallengeScheme = "Bearer";
}).AddJwtBearer(cfg =>
{
    cfg.RequireHttpsMetadata = false;
    cfg.SaveToken = true;
    cfg.TokenValidationParameters = new TokenValidationParameters
    {
        ValidIssuer = authenticationSettings.JwtIssuer,
        ValidAudience = authenticationSettings.JwtIssuer,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(authenticationSettings.JwtKey))
    };
});

builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.DictionaryKeyPolicy = JsonNamingPolicy.CamelCase;
    options.JsonSerializerOptions.PropertyNamingPolicy = JsonNamingPolicy.CamelCase;
});

builder.WebHost.ConfigureKestrel(options =>
{
    options.ListenAnyIP(5010);
});

//builder.AddHealthChecks();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();

    string solutionDirectory = EnvironmentUtils.GetSolutionDirectory();

    DbSetupEntity dbSetupEntity = new DbSetupEntity("beatka", "Intotech.Xerion")
    {
        ProjectName = "Intotech.Xerion.Database.Persistence",
        SqlFilePath = Path.Combine(solutionDirectory, "SQL", "xerion.sql"),
        BackendFolderPath = "Backend",
        SolutionDirectory = solutionDirectory
    };

    DbSetupFacade dbSetup = new DbSetupFacade(dbSetupEntity, EnvironmentUtils.IsDockerEnv ? "" : "Backend");

    //bool res = dbSetup.RunAll(true);

    //new XerionMainSeedManager().SeedAllDb();
}

app.Configuration.GetSection("Authentication").Bind(authenticationSettings);

app.UseCors(x => x.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()); // Angular Localhost

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.UseDeveloperExceptionPage();

app.Run();
