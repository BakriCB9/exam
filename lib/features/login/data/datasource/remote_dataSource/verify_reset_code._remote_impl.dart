import 'dart:convert';
import 'package:exam_app/features/login/data/datasource/remote_dataSource/reset_code.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api_manager/api_manager.dart';
import '../../../../../core/api_manager/api_result.dart';
import '../../../../../core/api_manager/excuter/api_excuter.dart';
import '../../../../register/data/models/user_model.dart';
import 'forgot_password_data_source.dart';

@Injectable(as: ResetCodeDataSource )
class VerifyResetCodeRemoteImpl extends ResetCodeDataSource {
  final ApiManager apiManager;
  VerifyResetCodeRemoteImpl(this.apiManager);




  @override
  Future<ApiResult<Map<String, dynamic>>> reset(String resetCode) {
    return excuteApi<Map<String,dynamic>>(() async{
      final response = await apiManager.post(
        data:{'resetCode': resetCode},
        endpoint: "/api/v1/auth/verifyResetCode",
      );
      print("-----------------------------------");
      print(response.data);
      return response.data;
    }
    );
  }
}

