import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/login/domain/repo/reset_code_repo.dart';
import 'package:injectable/injectable.dart';
import '../repo/forgot_password_repo.dart';
@injectable
class ResetCodeUsecase {
  final ResetCodeRepo repository;

  ResetCodeUsecase({required this.repository});

  Future<ApiResult<Map<String, dynamic>>> execute(String resetCode) {
    return repository.resetCode(resetCode);
  }
}