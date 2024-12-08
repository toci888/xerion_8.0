using Intotech.Common;
using Intotech.Common.Bll.Interfaces;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;

namespace Intotech.Xerion.Common.Seed.Xerion.Dictionaries;

public class FileParser
{
    public List<Profession> ParseProfessions(string sqlDataFilePath)
    {
        var filePath = FindPath(sqlDataFilePath);

        string[] lines = FileUtils.GetLinesFromFile(filePath);

        List<Profession> result = new List<Profession>();

        foreach (string content in lines)
        {
            string[] item = content.Split("\t");
            if (item.Length > 1 && item[1].Length > 0)
            {
                result.Add(new Profession()
                {
                    Name = item[1]
                });
            }
        }

        return result;
    }

    public static List<Framework> ParseLanguagesAndFrameworks(string sqlDataFilePath)
    {
        var filePath = FindPath(sqlDataFilePath);

        string[] lines = FileUtils.GetLinesFromFile(filePath);

        List<Framework> frameworks = new List<Framework>();

        string currentLanguage = string.Empty;
        string currentType = string.Empty;
        List<string> currentFrameworks = new List<string>();

        foreach (string line in lines)
        {
            if (!string.IsNullOrWhiteSpace(line))
            {
                if (line.EndsWith(":"))
                {
                    currentLanguage = line.TrimEnd(':');
                }
                else if (line.StartsWith("Frameworki frontendowe:") || line.StartsWith("Frameworki backendowe:"))
                {
                    currentType = line.StartsWith("Frameworki frontendowe:") ? "Frontend" : "Backend";
                    string frameworksLine = line.Substring(line.IndexOf(':') + 1);
                    currentFrameworks = new List<string>(frameworksLine.Split(new[] { ',' }, StringSplitOptions.TrimEntries));


                    if (currentLanguage != string.Empty && currentType != string.Empty)
                    {
                        foreach (var f in currentFrameworks)
                        {
                            frameworks.Add(new Framework(currentLanguage, currentType, f));
                        }
                        currentFrameworks.Clear();
                    }
                }
            }
            else
            {
                currentLanguage = string.Empty;
                currentType = string.Empty;
            }
        }

        return frameworks;
    }

    private static string FindPath(string sqlDataFilePath)
    {
        string solutionDirectory;

        if (Directory.GetCurrentDirectory() == "/app") // Docker
        {
            solutionDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).FullName + "/src/";
        }
        else
        {
            solutionDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
        }

        string filePath = Path.Combine(solutionDirectory, sqlDataFilePath);
        return filePath;
    }
}

public class Framework : ModelBase
{
    public string Language { get; set; }
    public string Category { get; set; }
    public string Frameworks { get; set; }

    public Framework(string language, string category, string frameworks)
    {
        Language = language;
        Category = category;
        Frameworks = frameworks;
    }
}
