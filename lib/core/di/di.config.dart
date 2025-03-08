// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/profile/edit_profile/data/remote/data_sources/show_data_data_source.dart'
    as _i549;
import '../../features/home/profile/edit_profile/data/remote/data_sources/show_data_data_source_impl.dart'
    as _i226;
import '../../features/home/profile/edit_profile/data/repositories/show_data_repo_impl.dart'
    as _i761;
import '../../features/home/profile/edit_profile/domain/repositories/show_data_repo.dart'
    as _i224;
import '../../features/home/profile/edit_profile/domain/use_cases/show_data_usecase.dart'
    as _i79;
import '../../features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit.dart'
    as _i755;
import '../../features/login/data/datasource/local_dataSource/local_dataSource_contract.dart'
    as _i968;
import '../../features/login/data/datasource/local_dataSource/local_dataSource_impl.dart'
    as _i678;
import '../../features/login/data/datasource/remote_dataSource/remote_api_dataSource_impl.dart'
    as _i503;
import '../../features/login/data/datasource/remote_dataSource/remote_datasource_impl.dart'
    as _i666;
import '../../features/login/data/repo/auth_repo_imp.dart' as _i436;
import '../../features/login/domain/repo/login_repo.dart' as _i0;
import '../../features/login/domain/usecase/loginUseCase.dart' as _i813;
import '../../features/login/presentation/cubit/cubit/login_cubit.dart' as _i39;
import '../../features/register/data/data_source/data_source.dart' as _i138;
import '../../features/register/data/data_source/remote/remote_data_source.dart'
    as _i850;
import '../../features/register/data/repo/user_repo_impl.dart' as _i497;
import '../../features/register/domain/repo/user_repo.dart' as _i683;
import '../../features/register/domain/usecase/register_user.dart' as _i779;
import '../../features/register/presentation/cubit/register_cubit.dart'
    as _i266;
import '../api_manager/api_manager.dart' as _i266;
import '../local_secure_storage/flutter_secure_storage.dart' as _i844;

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
    gh.singleton<_i844.LocalStroage>(() => _i844.LocalStroage());
    gh.factory<_i968.LocalDatasourceContract>(
        () => _i678.LocalDatasourceImpl(gh<_i844.LocalStroage>()));
    gh.factory<_i666.RemoteDataSourceContract>(
        () => _i503.RemoteApiDataSoucrceImpl(gh<_i266.ApiManager>()));
    gh.factory<_i138.DataSource>(
        () => _i850.RegisterDataSource(gh<_i266.ApiManager>()));
    gh.factory<_i549.ShowData>(
        () => _i226.ShowDataImpl(gh<_i266.ApiManager>()));
    gh.factory<_i0.LoginRepo>(() => _i436.LoginRepoImpl(
          gh<_i666.RemoteDataSourceContract>(),
          gh<_i968.LocalDatasourceContract>(),
        ));
    gh.factory<_i683.UserRepo>(
        () => _i497.UserRepoImpl(gh<_i138.DataSource>()));
    gh.factory<_i224.ShowDataRepo>(
        () => _i761.ShowDataRepoImpl(gh<_i549.ShowData>()));
    gh.factory<_i813.Loginusecase>(
        () => _i813.Loginusecase(gh<_i0.LoginRepo>()));
    gh.factory<_i779.RegisterUser>(
        () => _i779.RegisterUser(gh<_i683.UserRepo>()));
    gh.factory<_i79.ShowDataUseCase>(
        () => _i79.ShowDataUseCase(gh<_i224.ShowDataRepo>()));
    gh.factory<_i39.LoginCubit>(
        () => _i39.LoginCubit(gh<_i813.Loginusecase>()));
    gh.factory<_i266.RegistrationCubit>(
        () => _i266.RegistrationCubit(gh<_i779.RegisterUser>()));
    gh.factory<_i755.EditProfileCubit>(
        () => _i755.EditProfileCubit(gh<_i79.ShowDataUseCase>()));
    return this;
  }
}
