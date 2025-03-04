import 'package:injectable/injectable.dart';

import '../../../../../core/api_manager/api_manager.dart';
import '../../../../../core/api_manager/api_result.dart';
import '../../../../../core/api_manager/excuter/api_excuter.dart';
import '../../models/user_model.dart';
import '../data_source.dart';

@Injectable(as: DataSource)
class RegisterDataSource extends DataSource {
  final ApiManager apiManager;
  RegisterDataSource(this.apiManager);

  @override
  Future<ApiResult<Map<String, dynamic>>> register(UserModel user) async {
    return excuteApi<Map<String,dynamic>>(() async{
      final response = await apiManager.post(
        data: user.toJson(),
        endpoint: "/api/v1/auth/signup",
      );
      return response.data;
    }
    );
  }
}