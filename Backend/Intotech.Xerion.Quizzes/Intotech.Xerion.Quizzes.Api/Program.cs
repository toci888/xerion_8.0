using System.Text;
using System.Text.Json;
using Intotech.Common.Database.DbSetup;
using Intotech.Common;
using Intotech.Xerion.Bll.Models.Security;
using Intotech.Xerion.Common.Seed.Xerion.Quizzes;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Intotech.Common.Interfaces;
using Intotech.Xerion.Common.I18n;
using Intotech.Xerion.Companies.Bll.Persistence;
using Intotech.Xerion.Quizzes.Bll;
using Intotech.Xerion.Quizzes.Bll.Interfaces;
using Intotech.Xerion.Quizzes.Bll.Persistence;
using Intotech.Xerion.Quizzes.Bll.Persistence.Interfaces;
using Intotech.Xerion.Companies.Bll.Persistence.Interfaces;
using Intotech.Xerion.Bll.Persistence;
using Intotech.Xerion.Bll.Persistence.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddCors(x => x.AddPolicy("AllowOrigin", options => options.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader())); //Angular Localhost

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<ITranslationEngineI18n, XerionTranslationEngineI18n>();
builder.Services.AddScoped<IQuizService, QuizService>();
builder.Services.AddScoped<IQuizzesAnswersLogic, QuizzesAnswersLogic>();
builder.Services.AddScoped<IQuizzesQuestionsLogic, QuizzesQuestionsLogic>();
builder.Services.AddScoped<IQuizzesResultsLogic, QuizzesResultsLogic>();
builder.Services.AddScoped<IQuizzesAttemptsLogic, QuizzesAttemptsLogic>();
builder.Services.AddScoped<IQuizLogic, QuizLogic>();
builder.Services.AddScoped<IAccounttechnicalskillLogic, AccounttechnicalskillLogic>();
builder.Services.AddScoped<IAccountLogic, AccountLogic>();

builder.Services.AddScoped<IJobLogic, JobLogic>();

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
    options.ListenAnyIP(5015);
});

var app = builder.Build();
// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();

    string solutionDirectory = EnvironmentUtils.GetSolutionDirectory();

    DbSetupEntity dbSetupEntity = new DbSetupEntity("beatka", "Intotech.Xerion.Quizzes")
    {
        ProjectName = "Intotech.Xerion.Quizzes.Database.Persistence",
        SqlFilePath = Path.Combine(EnvironmentUtils.IsDockerEnv ? solutionDirectory : Directory.GetParent(solutionDirectory)?.FullName, "SQL/quizzes.sql"),
        BackendFolderPath = "Backend",
    };

    DbSetupFacade dbSetup = new DbSetupFacade(dbSetupEntity, EnvironmentUtils.IsDockerEnv ? "" : "Intotech.Xerion.Quizzes");

    bool res = dbSetup.RunAll(true);

    new XerionQuizzesSeedManager().SeedAllDb();
}

app.Configuration.GetSection("Authentication").Bind(authenticationSettings);

app.UseCors(x => x.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()); // Angular Localhost

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.UseDeveloperExceptionPage();

app.Run();
