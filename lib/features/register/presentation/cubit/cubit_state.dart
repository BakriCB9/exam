import 'package:equatable/equatable.dart';

enum Status { loading, success, error }

class RegistrationState extends Equatable {
  const RegistrationState(
      {required this.status,
      this.successMessage,
      this.error,
      this.loading = false});
  final Status status;
  final String? successMessage;
  final String? error;
  final bool loading;

  RegistrationState copyWith({
    String? successMessage,
    String? error,
    bool? loading,
    Status? status,
  }) {
    return RegistrationState(
        successMessage: successMessage ?? this.successMessage,
        error: error ?? this.error,
        loading: loading ?? this.loading,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [successMessage, error, status, loading];
}
