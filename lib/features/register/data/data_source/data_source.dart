import 'package:exam_app/core/di/api_manger/api_result.dart';
import 'package:exam_app/features/register/data/models/user_model.dart';

abstract class DataSource {

Future<ApiResult> register(UserModel user);
}