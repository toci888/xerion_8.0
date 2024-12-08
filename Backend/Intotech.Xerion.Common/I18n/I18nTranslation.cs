using Intotech.Xerion.Common.I18n.Managers;

namespace Intotech.Xerion.Common.I18n;

public static class I18nTranslationDep
{
    private static string Language = I18nTags.LanguageCodePl;
    //private static I18nManager i18NManager = new I18nManager(Language);

    private static Dictionary<string, I18nManager> LanguageManagers = new Dictionary<string, I18nManager>()
    {
        { I18nTags.LanguageCodeEn, new EnI18nManager() },
        { I18nTags.LanguageCodePl, new PlI18nManager() },
    };

    

    public static void SetLanguage(string language)
    {
        Language = language;
        //i18NManager = new I18nManager(Language);
    }

    public static string Translation(string tag)
    {
        I18nModel model = LanguageManagers.ContainsKey(Language) ? LanguageManagers[Language].GetTranslation(tag) : null;

        return model != null ? model.Content : tag;
    }
}