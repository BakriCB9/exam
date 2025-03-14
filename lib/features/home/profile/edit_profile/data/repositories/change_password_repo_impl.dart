import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/home/profile/edit_profile/data/remote/data_sources/change_password_data_source.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/repositories/change_passwod_repo.dart';
import 'package:injectable/injectable.dart';



@Injectable(as: ChangePasswordRepo)
class ChangePasswordReposI implements ChangePasswordRepo {
  final ChangePasswordRemote changePasswordRemote;

  ChangePasswordReposI(this.changePasswordRemote);

  @override
  Future<ApiResult<Map<String,dynamic>>>  changePassword(String oldPassword, String newPassword) async {
    return await changePasswordRemote.changePassword(oldPassword, newPassword);
  }
}
