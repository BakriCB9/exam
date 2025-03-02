
sealed class RegistrationState  {
  const RegistrationState();
}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final String message;

  RegistrationSuccess(this.message);
}

class RegistrationFailure extends RegistrationState {
   String  error;

  RegistrationFailure(this.error);
}