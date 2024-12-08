using Intotech.Common.Bll.Interfaces;
using Intotech.Common.Database;
using Intotech.Xerion.Quizzes.Database.Persistence.Models;

namespace Intotech.Xerion.Quizzes.Database;

public class DbHandleCriticalSectionIXQ<TModel> : DbHandleCriticalSection<TModel> where TModel : ModelBase
{
    public DbHandleCriticalSectionIXQ() : base(new IntotechXerionQuizzesContext(), "Host=localhost;Database=Intotech.Xerion.Quizzes;Username=postgres;Password=beatka")
    {
    }

}