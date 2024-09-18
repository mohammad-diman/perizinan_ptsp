class RegisterException implements Exception {
  final Map<String, dynamic> errorsMessage;

  RegisterException(this.errorsMessage);

  Map<String, dynamic> getErrorsMessage() {
    return errorsMessage;
  }
}