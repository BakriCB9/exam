import 'package:dio/dio.dart';
import 'package:exam_app/core/api_manager/api_request.dart';
import 'package:exam_app/core/api_manager/api_result.dart';

import 'package:exam_app/features/login/data/datasource/local_dataSource/local_dataSource_contract.dart';
import 'package:exam_app/features/login/data/datasource/remote_dataSource/remote_datasource_impl.dart';
import 'package:exam_app/features/login/data/model/loginModel.dart';
import 'package:exam_app/features/login/data/model/login_response/login_response.dart';
import 'package:exam_app/features/login/domain/repo/login_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final LocalDatasourceContract localDataSourceContract;
  final RemoteDataSourceContract remoteDataSourceContract;
  LoginRepoImpl(this.remoteDataSourceContract, this.localDataSourceContract);
  @override
  Future<ApiResult<LoginResponse>> login(
      ApiRequestModel<LoginRequestModel> requestBody) async {
    try {
      var ans = await remoteDataSourceContract.login(requestBody);
      if (ans.token != null) {
        await localDataSourceContract.saveUserToken(ans.token!);
      }
      return ApiResultSuccess<LoginResponse>(ans);
    } on DioException catch (e) {
      return ApiResultError<LoginResponse>(e.message.toString());
    } catch (e) {
      return ApiResultError<LoginResponse>(e.toString());
    }
  }
}
