import 'package:exam_app/core/api_manager/api_request.dart';
import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/login/data/model/loginModel.dart';
import 'package:exam_app/features/login/data/model/login_response/login_response.dart';

abstract class ForgotPasswordRepo {
  Future<ApiResult<Map<String, dynamic>>> forgotPassword(String email);
}
