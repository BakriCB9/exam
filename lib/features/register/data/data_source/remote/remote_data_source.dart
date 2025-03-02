import 'package:dio/dio.dart';
import 'package:exam_app/features/register/data/data_source/data_source.dart';
import 'package:exam_app/features/register/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api_manger/dio_consumer.dart';


@Injectable(as: DataSource)
class RegisterDataSource extends DataSource
{

  DioConsumer dioConsumer;

  RegisterDataSource(this.dioConsumer);
    @override

  Future<Map<String,dynamic>> register(UserModel user) async {
    try {
      final response = await dioConsumer.post("https://exam.elevateegy.com/api/v1/auth/signup", );
      return response;
    } on DioException catch (e) {

      throw Exception('Registration failed: ${e.response?.data ?? e.message}');
    }
  }


  
}