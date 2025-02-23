
import 'package:exam_app/features/register/domain/entite/user_entite.dart';
abstract class UserRepo {
  Future<void> register(UserEntite user);
}