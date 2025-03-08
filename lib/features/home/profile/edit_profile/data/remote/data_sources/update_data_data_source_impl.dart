import 'package:exam_app/core/api_manager/api_manager.dart';
import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/home/profile/edit_profile/data/remote/data_sources/show_data_data_source.dart';
import 'package:exam_app/features/home/profile/edit_profile/data/remote/data_sources/update_data_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/api_manager/excuter/api_excuter.dart';
import '../../../../../../../main.dart';
import '../../../domain/entities/profile_entity.dart';

@Injectable(as:UpdateData)
class UpdateDataDataSourceImpl implements UpdateData {
  final ApiManager apiManager;

  UpdateDataDataSourceImpl(this.apiManager);

  @override
  Future<ApiResult<Map<String,dynamic>>> update(ProfileEntity entity) async {
    return excuteApi<Map<String,dynamic>>(() async {
      final response = await apiManager.put(
        token: userToken,
        data: entity.toJson(),
        endpoint: "/api/v1/auth/editProfile",
      );
print("------------------------------------");
      print(response.data);
      return response.data;
    });
  }


}
