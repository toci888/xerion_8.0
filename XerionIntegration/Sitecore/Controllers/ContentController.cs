using System.Web.Http;

namespace Sitecore.Custom.Api
{
    public class ContentController : ApiController
    {
        public string Get() => "Hello from Sitecore!";
    }
}
