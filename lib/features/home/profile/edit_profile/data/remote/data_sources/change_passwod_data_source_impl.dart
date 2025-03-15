import 'package:exam_app/core/api_manager/api_manager.dart';
import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/core/api_manager/excuter/api_excuter.dart';
import 'package:exam_app/features/home/profile/edit_profile/data/remote/data_sources/change_password_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/helper_function/help_function.dart';

@Injectable(as: ChangePasswordRemote)
class ChangePasswordRemoteI implements ChangePasswordRemote {
  final ApiManager apiManager;

  ChangePasswordRemoteI(this.apiManager);

  @override
  Future<ApiResult<Map<String, dynamic>>> changePassword(String oldPassword, String newPassword) async {
    var data = {
      'oldPassword': oldPassword,
      'password': newPassword,
      'rePassword': newPassword,
    };

    return await excuteApi<Map<String, dynamic>>(() async {
      final response = await apiManager.patch(
        token:await getToken(),
        endpoint: "/api/v1/auth/changePassword",
        data: data,
      );
      return response.data;
    });
  }
}
