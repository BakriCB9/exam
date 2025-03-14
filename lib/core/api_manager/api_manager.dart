import 'package:dio/dio.dart';
import 'package:exam_app/config/constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  Dio dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));

  Future<Response> get({String? token,required String endpoint, var requestbody}) async {
    dio.options.headers["token"] = "$token";
    var response = await dio.get(endpoint, queryParameters: requestbody);
    return response;
  }

  Future<Response> post({String? token, required String endpoint, var data}) async {
    dio.options.headers["token"] = "$token";
    var response = await dio.post(endpoint, data: data);
    return response;
  }

  Future<Response> put({String? token, required String endpoint, var data}) async {
    dio.options.headers["token"] = "$token";
    var response = await dio.put(endpoint, data: data);
    return response;
  }
   Future<Response> patch({String? token, required String endpoint, var data}) async {
    dio.options.headers["token"] = "$token";
    var response = await dio.patch(endpoint, data: data);
    return response;
  }
}