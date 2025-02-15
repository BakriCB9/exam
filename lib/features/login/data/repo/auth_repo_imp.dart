import 'package:dio/dio.dart';
import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/auth/data/datasource/remote/remote_datasource_impl.dart';
import 'package:exam_app/features/auth/data/model/loginModel.dart';
import 'package:exam_app/features/auth/domain/repo/login_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final RemoteDataSourceContract remoteDataSourceContract;
  LoginRepoImpl(this.remoteDataSourceContract);
  @override
  Future<ApiResult<String>> login(LoginRequestModel requestBody) async {
    try {
      var ans = await remoteDataSourceContract.login(requestBody);
      return ApiResultSuccess<String>(ans);
    } on DioException catch (e) {
      return ApiResultError<String>(e.message.toString());
    } catch (e) {
      return ApiResultError<String>(e.toString());
    }
  }
}
