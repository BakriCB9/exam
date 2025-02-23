import 'package:dio/dio.dart';
import 'package:exam_app/config/constants.dart';
import 'package:exam_app/core/di/api_manger/api_manger.dart';
import 'package:exam_app/features/register/data/data_source/data_source.dart';
import 'package:exam_app/features/register/data/models/user_model.dart';
import 'package:injectable/injectable.dart';


@injectable
class RegisterDataSource
{

  ApiManger apiManger;

  RegisterDataSource(this.apiManger);
    @override

  Future<Map<String, dynamic>> register(UserModel user) async {
    try {
      final response = await apiManger.sendData(endPoint: registerEndPoint, user: user);
      print('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      // Log error
      print('Error: ${e.response?.data ?? e.message}');
      throw Exception('Registration failed: ${e.response?.data ?? e.message}');
    }
  }


  
}