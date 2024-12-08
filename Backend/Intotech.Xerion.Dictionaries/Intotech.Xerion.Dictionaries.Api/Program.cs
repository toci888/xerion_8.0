using System.Text;
using System.Text.Json;
using Intotech.Common;
using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Database.DbSetup;
using Intotech.Xerion.Bll.Manager;
using Intotech.Xerion.Bll.Manager.Interfaces;
using Intotech.Xerion.Bll.Models.Security;
using Intotech.Xerion.Common.Seed.Xerion.Dictionaries;
using Intotech.Xerion.Dictionaries.Bll.Persistence;
using Intotech.Xerion.Dictionaries.Bll.Persistence.Interfaces;
using Microsoft.IdentityModel.Tokens;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<IProfessionsLogic, ProfessionsLogic>();
builder.Services.AddScoped<IProfessionsManager, ProfessionsManager>();

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
    options.ListenAnyIP(5012);
});

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();

    string? solutionDirectory = EnvironmentUtils.GetSolutionDirectory();

    DbSetupEntity dbSetupEntity = new DbSetupEntity("beatka", "Intotech.Xerion.Dictionaries")
    {
        ProjectName = "Intotech.Xerion.Dictionaries.Database.Persistence",
        SqlFilePath = Path.Combine(EnvironmentUtils.IsDockerEnv ? solutionDirectory : Directory.GetParent(solutionDirectory)?.FullName, "SQL/dictionaries.sql"),
        BackendFolderPath = "Backend",
    };

    DbSetupFacade dbSetup = new DbSetupFacade(dbSetupEntity, "Intotech.Xerion.Dictionaries");

    bool res = dbSetup.RunAll(true);

    new XerionDictionariesSeedManager().SeedAllDb();
}

app.Configuration.GetSection("Authentication").Bind(authenticationSettings);

app.UseCors(x => x.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()); // Angular Localhost

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.UseDeveloperExceptionPage();

app.Run();
