import 'package:exam_app/features/register/data/models/user_model.dart';

import '../../../../core/api_manager/api_result.dart';


abstract class DataSource {

Future< ApiResult<Map<String,dynamic>>> register(UserModel user);
}