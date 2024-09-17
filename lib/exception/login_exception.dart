class LoginException implements Exception {
  final Map<String, dynamic> errorsMessage;

  LoginException(this.errorsMessage);

 Map<String, dynamic> getErrorsMessage() {
    return errorsMessage;
  }
}
