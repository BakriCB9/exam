
import 'package:exam_app/features/register/data/data_source/api_manger.dart';
import 'package:exam_app/features/register/data/models/user_model.dart';
import 'package:exam_app/features/register/domain/entite/user_entite.dart';
import 'package:exam_app/features/register/domain/repo/user_repo.dart';


class UserRepoImpl implements UserRepo {
  final ApiManger api;

  UserRepoImpl(this.api);

  @override
  Future<void> register(UserEntite user) async {
    await api.register(UserModel(
      username: user.username,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      phone: user.phone,
      password: user.password,
      rePassword: user.rePassword


    ));
  }
}