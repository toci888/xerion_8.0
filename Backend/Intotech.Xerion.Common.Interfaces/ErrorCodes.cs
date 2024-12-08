namespace Intotech.Xerion.Common.Interfaces;

public static class ErrorCodes
{
    public const int FriendshipNotFound = 5;
    public const int DataAlreadyExistInDatabase = 6;
    public const int FailedToAddInformation = 7;
    public const int AccountNotFound = 8;
    public const int EmailIsNotConfirmed = 9;
    public const int AccountExists = 10;
    public const int ErrorPleaseLogInToApp = 11;
    public const int RefreshTokenExpiredPleaseLogIn = 12;
    public const int DataIntegrityViolated = 13;
    public const int UnderAttack = 14;
    public const int PleaseConfirmEmail = 15;
    public const int PleaseLogIn = 16;
    public const int EmailIsNotConfirmedPassMatch = 17;
    public const int EmailDoesNotExistResetPassword = 18;
    public const int WrongPushTokenOperations = 19;
    // dodajesz swoje nowe errory
    // 4 8 16 32 64 128
    public const int Success = 1;
    public const int FailVerifyingAccount = 2;
    public const int LoggedInViaRegistration = 3;
    public const int NoData = 4;
}