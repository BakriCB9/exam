import 'package:exam_app/features/register/data/models/user_model.dart';


abstract class DataSource {

Future< Map<String,dynamic>> register(UserModel user);
}