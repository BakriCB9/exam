import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/login/data/datasource/remote_dataSource/forgot_password_data_source.dart';
import 'package:exam_app/features/login/domain/repo/forgot_password_repo.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/reset_code_repo.dart';
import '../datasource/remote_dataSource/forget_password_remote_data_source_impl.dart';
import '../datasource/remote_dataSource/reset_code.dart';

@Injectable(as:ResetCodeRepo)
class ForgotPasswordRepoImpl  implements ResetCodeRepo {
  final ResetCodeDataSource resetCodeDataSource;
  ForgotPasswordRepoImpl(this.resetCodeDataSource);

  @override
  Future<ApiResult<Map<String, dynamic>>> resetCode(String resetCode) async {
    return await resetCodeDataSource.reset(resetCode);
  }
}
