import 'package:equatable/equatable.dart';

enum Status { loading, success, error, notValidateForm,init }

class RegistrationState extends Equatable {
  const RegistrationState(
      {required this.status,
      this.successMessage,
      this.error,
     });
  final Status status;
  final String? successMessage;
  final String? error;

  RegistrationState copyWith({
    String? successMessage,
    String? error,
    Status? status,
  }) {
    return RegistrationState(
        successMessage: successMessage ?? this.successMessage,
        error: error ?? this.error,

        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [ status,error];
}
