import 'package:exam_app/features/login/data/model/loginModel.dart';

abstract class RemoteDataSourceContract {
  Future<String> login(LoginRequestModel requestBody);
}
