// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasource/remote/remote_api_dataSource_impl.dart'
    as _i631;
import '../../features/auth/data/datasource/remote/remote_datasource_impl.dart'
    as _i850;
import '../../features/auth/data/repo/auth_repo_imp.dart' as _i39;
import '../../features/auth/domain/repo/login_repo.dart' as _i543;
import '../../features/auth/domain/usecase/loginUseCase.dart' as _i105;
import '../../features/auth/presentation/cubit/cubit/login_cubit.dart' as _i481;
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
    gh.factory<_i850.RemoteDataSourceContract>(
        () => _i631.RemoteApiDataSoucrceImpl(gh<_i266.ApiManager>()));
    gh.factory<_i543.LoginRepo>(
        () => _i39.LoginRepoImpl(gh<_i850.RemoteDataSourceContract>()));
    gh.factory<_i105.Loginusecase>(
        () => _i105.Loginusecase(gh<_i543.LoginRepo>()));
    gh.factory<_i481.LoginCubit>(
        () => _i481.LoginCubit(gh<_i105.Loginusecase>()));
    return this;
  }
}
