import '../../../../../core/api_manager/api_result.dart';
abstract class ResetCodeDataSource{
  Future<ApiResult<Map<String, dynamic>>> reset(String resetCode);

}