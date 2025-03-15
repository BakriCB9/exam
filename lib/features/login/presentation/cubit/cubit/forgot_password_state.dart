import 'package:equatable/equatable.dart';

enum StatusForgetPassword { loading, success, error,init }

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState(
      {required this.status,
        this.successMessage,
        this.error,
      });
  final StatusForgetPassword status;
  final String? successMessage;
  final String? error;

  ForgotPasswordState copyWith({
    String? successMessage,
    String? error,
    StatusForgetPassword? status,
  }) {
    return ForgotPasswordState(
        successMessage: successMessage ?? this.successMessage,
        error: error ?? this.error,

        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [ status,error];
}
