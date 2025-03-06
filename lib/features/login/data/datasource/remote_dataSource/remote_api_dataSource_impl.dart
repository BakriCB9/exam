import 'package:exam_app/config/constants.dart';
import 'package:exam_app/core/api_manager/api_manager.dart';
import 'package:exam_app/core/api_manager/api_request.dart';

import 'package:exam_app/features/login/data/datasource/remote_dataSource/remote_datasource_impl.dart';
import 'package:exam_app/features/login/data/model/loginModel.dart';
import 'package:exam_app/features/login/data/model/login_response/login_response.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: RemoteDataSourceContract)
class RemoteApiDataSoucrceImpl implements RemoteDataSourceContract {
  ApiManager apiManager;
  RemoteApiDataSoucrceImpl(this.apiManager);
  @override
  Future<LoginResponse> login(
      ApiRequestModel<LoginRequestModel> requestBody) async {
    var body = await apiManager.post(
        endpoint: AppConstants.login, data: requestBody.data.toJson());

    return LoginResponse.fromJson(body.data);
  }
}
