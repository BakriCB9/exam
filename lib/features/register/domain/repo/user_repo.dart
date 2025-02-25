
import 'package:exam_app/features/register/domain/entite/user_entite.dart';

import '../../../../core/di/api_manger/api_result.dart';
abstract class UserRepo {
  Future< ApiResult> register(UserEntite user);
}