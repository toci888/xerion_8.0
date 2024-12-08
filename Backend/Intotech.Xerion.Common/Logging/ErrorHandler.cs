﻿using Intotech.Common;

namespace Intotech.Xerion.Common.Logging;

public static class ErrorHandler
{
    private static IErrorLogger ErrorDebugLogger = new ErrorLogger();

    public static void LogError(Exception ex)
    {
        List<Exception> currentList = new List<Exception>();

        currentList = BreakDownException(ex, currentList);

        ErrorDebugLogger.Log(currentList);
    }

    public static void LogDebug(string message)
    {
        ErrorDebugLogger.Log(message);
    }

    private static List<Exception> BreakDownException(Exception masterExc, List<Exception> currentList)
    {
        currentList.Add(masterExc);

        if (masterExc.InnerException != null)
        {
            BreakDownException(masterExc.InnerException, currentList);
        }

        return currentList;
    }
}