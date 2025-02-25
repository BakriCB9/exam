
import 'package:exam_app/core/di/api_manger/api_result.dart';
import 'package:exam_app/features/register/data/data_source/data_source.dart';
import 'package:exam_app/features/register/data/data_source/remote/remote_data_source.dart';
import 'package:exam_app/features/register/data/models/user_model.dart';
import 'package:exam_app/features/register/domain/entite/user_entite.dart';
import 'package:exam_app/features/register/domain/repo/user_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:UserRepo)
class UserRepoImpl implements UserRepo {
  final DataSource registerDataSource;


  UserRepoImpl(this.registerDataSource);

  @override
  Future<ApiResult<void>> register(UserEntite user) async {


  return  await registerDataSource.register(UserModel(
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