import 'package:dio/dio.dart';
import 'package:exam_app/config/constants.dart';

class ApiManager {
  Dio dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));
}
