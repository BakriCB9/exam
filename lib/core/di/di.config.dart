// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/register/data/data_source/data_source.dart' as _i138;
import '../../features/register/data/data_source/remote/remote_data_source.dart'
    as _i850;
import '../../features/register/data/repo/user_repo_impl.dart' as _i497;
import '../../features/register/domain/repo/user_repo.dart' as _i683;
import '../../features/register/domain/usecase/register_user.dart' as _i779;
import '../../features/register/presentation/cubit/register_cubit.dart'
    as _i266;
import '../api_manager/api_manager.dart' as _i266;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i266.ApiManager>(() => _i266.ApiManager());
    gh.factory<_i138.DataSource>(
        () => _i850.RegisterDataSource(gh<_i266.ApiManager>()));
    gh.factory<_i683.UserRepo>(
        () => _i497.UserRepoImpl(gh<_i138.DataSource>()));
    gh.factory<_i779.RegisterUser>(
        () => _i779.RegisterUser(gh<_i683.UserRepo>()));
    gh.factory<_i266.RegistrationCubit>(
        () => _i266.RegistrationCubit(gh<_i779.RegisterUser>()));
    return this;
  }
}
