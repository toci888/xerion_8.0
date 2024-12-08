using Intotech.Xerion.Bll.Interfaces.Accounts;

namespace Intotech.Xerion.Bll.Accounts;

public abstract class GlfServiceBase<TTokenContent> : IGlfService<TTokenContent> where TTokenContent : class
{
    protected HttpClient HttpClient;

    protected string ApiUrl;

    protected GlfServiceBase(string apiUrl)
    {
        HttpClient = new HttpClient();
        ApiUrl = apiUrl;
    }

    protected virtual string Request(string token, string uri)
    {
        HttpClient.BaseAddress = new Uri(ApiUrl);
        HttpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer" + token);

        return HttpClient.GetAsync(uri).Result.Content.ReadAsStringAsync().Result;
    }

    public abstract TTokenContent GetUserByToken(string token);
}