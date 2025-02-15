import 'package:exam_app/features/auth/data/model/loginModel.dart';

abstract class RemoteDataSourceContract {
  Future<String> login(LoginRequestModel requestBody);
}
