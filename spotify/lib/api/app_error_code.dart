// ignore_for_file: constant_identifier_names, unused_local_variable

class AppErrorCode {
  static const int SOMETHING_WENT_WRONG = -1;
  static const int SUCCESS = 0;

  static const int SERVER_ERROR = 404;

  static const int INTERNET_NOT_CONNECTION = 02;
  static const int REQUEST_URL_EMPTY = 03;
  static const int CONNECTION_TIME_OUT = 04;

  //* === IN USE ===
  static const int TOKEN_INVALID_CODE = 401;

  //* API response code
  static const int EMAIL_IS_EXIST = 00001;

  static String getMessageError(int errorCode) {
    String message = "";
    switch (errorCode) {
      case AppErrorCode.TOKEN_INVALID_CODE:
        message = "Token invalid";
        break;
      case AppErrorCode.EMAIL_IS_EXIST:
        message = "Email is already exist";
        break;
      case AppErrorCode.CONNECTION_TIME_OUT:
        message = "CONNECTION TIME OUT";
        break;
      case AppErrorCode.SERVER_ERROR:
        message = "Server error";
        break;
      case AppErrorCode.INTERNET_NOT_CONNECTION:
        message = "Please check your network connection and try again";
        break;
      default:
        message = "SOME THING WENT WRONG";
        break;
    }
    return message;
  }
}
