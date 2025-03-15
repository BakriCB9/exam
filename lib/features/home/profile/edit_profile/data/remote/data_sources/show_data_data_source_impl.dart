import 'package:exam_app/core/api_manager/api_manager.dart';
import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/core/helper_function/help_function.dart';
import 'package:exam_app/features/home/profile/edit_profile/data/remote/data_sources/show_data_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/api_manager/excuter/api_excuter.dart';

@Injectable(as:ShowData)
class ShowDataImpl implements ShowData {
  final ApiManager apiManager;

  ShowDataImpl(this.apiManager);

  @override
  Future<ApiResult<Map<String,dynamic>>> show() async {
    return excuteApi<Map<String,dynamic>>(() async {
      final response = await apiManager.get(
        token:await getToken(),
        endpoint: "/api/v1/auth/profileData",
      );
      return response.data;
    });
  }


}
