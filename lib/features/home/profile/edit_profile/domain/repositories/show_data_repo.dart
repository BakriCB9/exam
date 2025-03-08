import 'package:exam_app/core/api_manager/api_result.dart';

import '../entities/show_data_entite.dart';
abstract class ShowDataRepo
{
  Future<ApiResult<Map<String,dynamic>>> showData();

}