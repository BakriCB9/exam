import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/entities/profile_entity.dart';
abstract class UpdateDataRepo
{
  Future<ApiResult<Map<String,dynamic>>> updateData(ProfileEntity entity);

}