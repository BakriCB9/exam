import 'package:dio/dio.dart';
import 'package:exam_app/config/constants.dart';
import 'package:exam_app/features/auth/data/model/loginModel.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  Dio dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));

  Future<Response> login({required LoginRequestModel requestbody}) async {
    print('the request is ${requestbody.toJson()}');
    print('the emial is ${requestbody.email}');
    print('the password is ${requestbody.password}');
    print('');
    var response =
        await dio.post(AppConstants.login, data: requestbody.toJson());
    return response;
  }
}
