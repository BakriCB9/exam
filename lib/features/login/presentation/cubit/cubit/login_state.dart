sealed class LoginState {}

final class LoginStateInit extends LoginState {}

final class LoginStateLoading extends LoginState {}

final class LoginStateSuccess extends LoginState {
  String message;
  LoginStateSuccess(this.message);
}

final class LoginStateError extends LoginState {
  String message;
  LoginStateError(this.message);
}
