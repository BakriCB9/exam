import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/login/data/model/loginModel.dart';

abstract class LoginRepo {
  Future<ApiResult<String>> login(LoginRequestModel requestBody);
}
