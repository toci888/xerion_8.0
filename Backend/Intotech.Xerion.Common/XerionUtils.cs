using Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;

namespace Intotech.Xerion.Common;

public static class XerionUtils
{
    public static DateTime? ParseDateTime(DateTime date)
    {
        if (date != null && DateTime.TryParse(date.ToString(), out DateTime parsedDateTime))
        {
            return parsedDateTime;
        }

        return null;
    }
}