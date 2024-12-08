using Intotech.Common.Bll;
using Intotech.Common.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Intotech.Xerion.Common.Logging
{
    public abstract class LoggerServiceBase : ServiceBase
    {
        protected LoggerServiceBase(ITranslationEngineI18n i18nTranslation) : base(new ErrorLogger(), i18nTranslation) { }
    }
}
