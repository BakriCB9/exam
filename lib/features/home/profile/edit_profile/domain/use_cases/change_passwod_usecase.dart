import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/repositories/change_passwod_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepo repo;

  ChangePasswordUseCase(this.repo);

  Future<ApiResult<Map<String,dynamic>>> execute(String oldPassword, String newPassword) async {
    return await repo.changePassword(oldPassword, newPassword);
  }
}
