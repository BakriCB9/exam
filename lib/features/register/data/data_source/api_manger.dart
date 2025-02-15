import 'package:dio/dio.dart';
import 'package:exam_app/features/register/data/models/user_model.dart';

class ApiManger {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> register(UserModel user) async {
    try {
      final response = await dio.post(
        'https://exam.elevateegy.com/api/v1/auth/signup',
        data: user.toJson(),
      );
      print('Response: ${response.data}');
      return response.data;
    } on DioError catch (e) {
      // Log error
      print('Error: ${e.response?.data ?? e.message}');
      throw Exception('Registration failed: ${e.response?.data ?? e.message}');
    }
  }
}
