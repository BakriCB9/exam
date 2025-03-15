import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:injectable/injectable.dart';
import '../repo/forgot_password_repo.dart';
@injectable
class ForgotPasswordUseCase {
  final ForgotPasswordRepo repository;

  ForgotPasswordUseCase({required this.repository});

  Future<ApiResult<Map<String, dynamic>>> execute(String email) {
    return repository.forgotPassword(email);
  }
}