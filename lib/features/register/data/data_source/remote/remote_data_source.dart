import 'package:dio/dio.dart';
import 'package:exam_app/core/api_manager/api_manager.dart';
import 'package:exam_app/features/register/data/data_source/data_source.dart';
import 'package:exam_app/features/register/data/models/user_model.dart';
import 'package:injectable/injectable.dart';



@Injectable(as: DataSource)
class RegisterDataSource extends DataSource
{

  ApiManager apiManager;

  RegisterDataSource(this.apiManager);
    @override

  Future<Map<String,dynamic>> register(UserModel user) async {
    try {
      final response = await apiManager.post( data:user.toJson(),endpoint:"/api/v1/auth/signup");
      return response.data;
    } on DioException catch (e) {

      throw Exception('Registration failed: ${e.response?.data ?? e.message}');
    }
  }


  
}