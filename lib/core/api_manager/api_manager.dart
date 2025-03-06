import 'package:dio/dio.dart';
import 'package:exam_app/config/constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  Dio dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
  Future<Response> get({required String endpoint, var requestbody}) async {
    var response = await dio.get(AppConstants.login, data: requestbody);
    return response;
  }

  Future<Response> post(
      {String? token, required String endpoint, var data}) async {
    var response = await dio.post(endpoint, data: data);
    return response;
  }
// Future<Response> get({required String ans,required String endpoint,}){
//   var response= dio.get(endpoint,data: ans);
// }
}
