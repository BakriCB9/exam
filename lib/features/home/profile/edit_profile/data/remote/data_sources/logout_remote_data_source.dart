
import 'package:exam_app/core/api_manager/api_manager.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../main.dart';
@injectable
class LogoutRemoteDataSource {
  final ApiManager apiManager;

  LogoutRemoteDataSource({required this.apiManager});

  Future<void> logout() async {

    await apiManager.post(
      token: userToken,
      endpoint: '/api/v1/auth/logout',
    );
  }
}
