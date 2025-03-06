
import 'package:exam_app/features/register/domain/entite/user_entite.dart';

import '../../../../core/api_manager/api_result.dart';
abstract class UserRepo {
  Future< ApiResult<Map<String,dynamic>>> register(UserEntite user);
}