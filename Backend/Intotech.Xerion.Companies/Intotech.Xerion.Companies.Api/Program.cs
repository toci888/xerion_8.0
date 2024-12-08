using Intotech.Common.Database.DbSetup;
using Intotech.Common;
using Intotech.Xerion.Companies.Bll;
using Intotech.Xerion.Companies.Bll.Interfaces;
using Intotech.Xerion.Companies.Bll.Persistence;
using Intotech.Xerion.Companies.Bll.Persistence.Interfaces;
using Intotech.Common.Interfaces;
using Intotech.Xerion.Common.I18n;
using System.Text;
using System.Text.Json;
using Microsoft.IdentityModel.Tokens;
using Intotech.Xerion.Bll.Models.Security;
using Intotech.Xerion.Common.Seed.Xerion.Companies;
using Intotech.Xerion.Quizzes.Bll.Persistence.Interfaces;
using Intotech.Xerion.Quizzes.Bll.Persistence;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddCors(x => x.AddPolicy("AllowOrigin", options => options.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader())); //Angular Localhost

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<ITranslationEngineI18n, XerionTranslationEngineI18n>();
builder.Services.AddScoped<ICompanyLogic, CompanyLogic>();
builder.Services.AddScoped<ICompanyService, CompanyService>();
builder.Services.AddScoped<ICompanyImageLogic, CompanyImageLogic>();
builder.Services.AddScoped<ICompanyTechnologyLogic, CompanyTechnologyLogic>();
builder.Services.AddScoped<ICompanySocialMediaLinkLogic, CompanySocialMediaLinkLogic>();
builder.Services.AddScoped<ICompanyOfficeLogic, CompanyOfficeLogic>();
builder.Services.AddScoped<IJobService, JobService>();
builder.Services.AddScoped<IJobLogic, JobLogic>();
builder.Services.AddScoped<IJobTechnologiesLogic, JobTechnologiesLogic>();
builder.Services.AddScoped<IJobApplicationsLogic, JobApplicationsLogic>();
builder.Services.AddScoped<IJobDetailsLogic, JobDetailsLogic>();
builder.Services.AddScoped<IJobCompaniesViewsLogic, JobCompaniesViewsLogic>();
builder.Services.AddScoped<IQuizLogic, QuizLogic>();

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
    options.ListenAnyIP(5013);
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();

    string solutionDirectory = EnvironmentUtils.GetSolutionDirectory();

    DbSetupEntity dbSetupEntity = new DbSetupEntity("beatka", "Intotech.Xerion.Companies")
    {
        ProjectName = "Intotech.Xerion.Companies.Database.Persistence",
        SqlFilePath = Path.Combine(EnvironmentUtils.IsDockerEnv ? solutionDirectory : Directory.GetParent(solutionDirectory)?.FullName, "SQL/companies.sql"),
        BackendFolderPath = "Backend",
    };

    DbSetupFacade dbSetup = new DbSetupFacade(dbSetupEntity, EnvironmentUtils.IsDockerEnv ? "" : "Intotech.Xerion.Companies");

    bool res = dbSetup.RunAll(true);

    new XerionCompaniesSeedManager().SeedAllDb();
}

app.Configuration.GetSection("Authentication").Bind(authenticationSettings);

app.UseCors(x => x.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()); // Angular Localhost

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.UseDeveloperExceptionPage();

app.Run();
