import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/auth/data/model/loginModel.dart';
import 'package:exam_app/features/auth/domain/repo/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class Loginusecase {
  final LoginRepo loginRepo;
  Loginusecase(this.loginRepo);
  Future<ApiResult<String>> call(LoginRequestModel requestBody) =>
      loginRepo.login(requestBody);
}
