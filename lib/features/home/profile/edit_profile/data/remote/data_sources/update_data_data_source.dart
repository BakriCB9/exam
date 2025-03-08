import '../../../../../../../core/api_manager/api_result.dart';
import '../../../domain/entities/profile_entity.dart';

abstract class UpdateData
{
  Future<ApiResult<Map<String,dynamic>>> update(ProfileEntity entity);
}