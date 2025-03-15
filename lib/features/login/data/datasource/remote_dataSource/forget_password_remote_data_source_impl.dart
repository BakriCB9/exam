import 'dart:convert';
import 'package:injectable/injectable.dart';

import '../../../../../core/api_manager/api_manager.dart';
import '../../../../../core/api_manager/api_result.dart';
import '../../../../../core/api_manager/excuter/api_excuter.dart';
import '../../../../register/data/models/user_model.dart';
import 'forgot_password_data_source.dart';

@Injectable(as: ForgotPasswordDataSource )
class ForgotPasswordDataSourceImpl extends ForgotPasswordDataSource {
  final ApiManager apiManager;
  ForgotPasswordDataSourceImpl(this.apiManager);


  @override
  Future<ApiResult<Map<String, dynamic>>> forgotPassword(String email) async {
    return excuteApi<Map<String,dynamic>>(() async{
      final response = await apiManager.post(
        data:jsonEncode({'email': email}),
        endpoint: "/api/v1/auth/forgotPassword",
      );
      print("-----------------------------------");
      print(response.data);
      return response.data;
    }
    );
  }
}

