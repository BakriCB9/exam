import '../../../../../../../core/api_manager/api_result.dart';
import '../../../domain/entities/show_data_entite.dart';

abstract class ShowData
{
  Future<ApiResult<Map<String,dynamic>>> show();
}