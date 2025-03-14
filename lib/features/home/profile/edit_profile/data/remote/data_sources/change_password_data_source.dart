import 'package:exam_app/core/api_manager/api_result.dart';

abstract class ChangePasswordRemote {
  Future<ApiResult<Map<String,dynamic>>>  changePassword(String oldPassword, String newPassword);
}