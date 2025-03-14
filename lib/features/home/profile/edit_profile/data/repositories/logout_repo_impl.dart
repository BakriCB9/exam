import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/core/api_manager/excuter/api_excuter.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/logout_usecase.dart';
import '../remote/data_sources/logout_remote_data_source.dart';


@Injectable(as: LogoutUseCase)

class LogoutRepositoryImpl implements LogoutUseCase {
  final LogoutRemoteDataSource remoteDataSource;

  LogoutRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> call() async {
    final result = await excuteApi(() async {
      return await remoteDataSource.logout();
    });

  }
}
