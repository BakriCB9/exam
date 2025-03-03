import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api_manager/api_manager.dart';
import '../../../../../core/api_manager/api_result.dart';
import '../../models/user_model.dart';
import '../data_source.dart';

@Injectable(as: DataSource)
class RegisterDataSource extends DataSource {
  final ApiManager apiManager;

  RegisterDataSource(this.apiManager);

  @override
  Future<ApiResult<Map<String, dynamic>>> register(UserModel user) async {
    try {
      final response = await apiManager.post(
        data: user.toJson(),
        endpoint: "/api/v1/auth/signup",
      );
      return SuccessApiResult(response.data);
    } on DioException catch (e) {
      print("Registration failed: ${e.response?.data["message"] ?? e.message}");
      return ErrorApiResult(Exception(' ${e.response?.data["message"]}'));
    }
  }
}