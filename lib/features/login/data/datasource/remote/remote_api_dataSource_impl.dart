import 'package:exam_app/core/api_manager/api_manager.dart';
import 'package:exam_app/features/auth/data/datasource/remote/remote_datasource_impl.dart';
import 'package:exam_app/features/auth/data/model/loginModel.dart';
import 'package:exam_app/features/auth/data/model/login_response/login_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteDataSourceContract)
class RemoteApiDataSoucrceImpl implements RemoteDataSourceContract {
  ApiManager apiManager;
  RemoteApiDataSoucrceImpl(this.apiManager);
  @override
  Future<String> login(LoginRequestModel requestBody) async {
    var body = await apiManager.login(requestbody: requestBody);

    return LoginResponse.fromJson(body.data).message ?? " ";
  }
}
