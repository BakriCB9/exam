
import 'package:exam_app/features/register/domain/entite/user_entite.dart';
import 'package:exam_app/features/register/domain/repo/user_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterUser {
  final UserRepo repo;

  RegisterUser(this.repo);

  Future<void> call(UserEntite user) {
    return repo.register(user);
  }
}