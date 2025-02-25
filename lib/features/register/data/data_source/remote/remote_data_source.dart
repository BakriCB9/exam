import 'package:dio/dio.dart';
import 'package:exam_app/config/constants.dart';
import 'package:exam_app/core/di/api_manger/api_manger.dart';
import 'package:exam_app/core/di/api_manger/api_result.dart';
import 'package:exam_app/features/register/data/data_source/data_source.dart';
import 'package:exam_app/features/register/data/models/user_model.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: DataSource)
class RegisterDataSource extends DataSource
{

  ApiManger apiManger;

  RegisterDataSource(this.apiManger);
    @override

  Future<ApiResult<Map<String,dynamic>>> register(UserModel user) async {
    try {
      final response = await apiManger.sendData(endPoint: registerEndPoint, user: user);
      print('Response: ${response.data}');
      return   SucessApiResult(response.data);
    } on DioException catch (e) {
    return ErrorApiResul(e);
    }
  }


  
}