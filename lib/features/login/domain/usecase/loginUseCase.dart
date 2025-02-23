import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/login/data/model/loginModel.dart';
import 'package:exam_app/features/login/data/model/login_response/login_response.dart';
import 'package:exam_app/features/login/domain/repo/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class Loginusecase {
  final LoginRepo loginRepo;
  Loginusecase(this.loginRepo);
  Future<ApiResult<LoginResponse>> call(LoginRequestModel requestBody) =>
      loginRepo.login(requestBody);
}
