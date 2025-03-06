import 'package:exam_app/config/constants.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/core/local_secure_storage/flutter_secure_storage.dart';

Future<String?> getToken() async {
  final localStorage = getIt.get<LocalStroage>();

  return await localStorage.getToken(key: AppCashConstant.token);
}
