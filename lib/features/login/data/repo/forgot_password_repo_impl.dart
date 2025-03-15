import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/login/data/datasource/remote_dataSource/forgot_password_data_source.dart';
import 'package:exam_app/features/login/domain/repo/forgot_password_repo.dart';
import 'package:injectable/injectable.dart';

import '../datasource/remote_dataSource/forget_password_remote_data_source_impl.dart';

@Injectable(as:ForgotPasswordRepo)
class ForgotPasswordRepoImpl  implements ForgotPasswordRepo {
  final ForgotPasswordDataSource remoteDataSource;

  ForgotPasswordRepoImpl({required this.remoteDataSource});

  Future<ApiResult<Map<String, dynamic>>> forgotPassword(String email) async {
    return await remoteDataSource.forgotPassword(email);
  }
}
