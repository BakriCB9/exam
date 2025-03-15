
import 'package:exam_app/core/api_manager/api_manager.dart';
import 'package:exam_app/core/helper_function/help_function.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutRemoteDataSource {
  final ApiManager apiManager;

  LogoutRemoteDataSource({required this.apiManager});

  Future<void> logout() async {

    await apiManager.post(
      token: await getToken(),
      endpoint: '/api/v1/auth/logout',
    );

  }
}
