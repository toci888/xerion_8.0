using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Microservices;
using Intotech.Xerion.Common.Translations;
using Microsoft.AspNetCore.Http;

namespace Intotech.Xerion.Common
{
    public class XerionApiSimpleControllerBase<TManager> : ApiSimpleControllerBase<TManager>
        where TManager : IManager
    {
        protected XerionApiSimpleControllerBase(TManager manager, IHttpContextAccessor httpContextAccessor) : base(manager, httpContextAccessor)
        {
            I18nTranslation = new XerionTranslationEngineI18n();
        }
    }
}
