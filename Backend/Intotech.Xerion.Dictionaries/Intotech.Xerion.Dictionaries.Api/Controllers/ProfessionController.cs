using Intotech.Xerion.Bll.Manager.Interfaces;
using Intotech.Xerion.Common;
using Intotech.Xerion.Dictionaries.Database.Persistence.Models;
using Microsoft.AspNetCore.Mvc;

namespace Intotech.Xerion.Dictionaries.Api.Controllers;

[Route("api/[controller]")]
[ApiController]
public class ProfessionController : XerionApiSimpleControllerBase<IProfessionsManager>
{
    public ProfessionController(IProfessionsManager manager, IHttpContextAccessor httpContextAccessor) : base(manager, httpContextAccessor)
    {
        
    }

    [HttpGet]
    public List<Profession> GetProfessions(string filter)
    {
        return Manager.GetDictionaryItems(filter);
    }
}