import 'package:exam_app/core/api_manager/api_result.dart';
abstract class ShowDataRepo
{
  Future<ApiResult<Map<String,dynamic>>> showData();

}