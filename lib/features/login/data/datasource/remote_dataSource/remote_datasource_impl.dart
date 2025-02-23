import 'package:exam_app/features/login/data/model/loginModel.dart';
import 'package:exam_app/features/login/data/model/login_response/login_response.dart';

abstract class RemoteDataSourceContract {
  Future<LoginResponse> login(LoginRequestModel requestBody);
}
