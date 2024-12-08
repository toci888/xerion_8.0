using Intotech.Xerion.Common.Interfaces.I18n;

namespace Intotech.Xerion.Common.I18n;

public class I18nModel : II18nModel
{
    public string Language { get; set; }
    public string Tag { get; set; }
    public string Content { get; set; }
}