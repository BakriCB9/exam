import '../../../../../core/api_manager/api_result.dart';
abstract class ForgotPasswordDataSource{
  Future<ApiResult<Map<String, dynamic>>> forgotPassword(String email);

}