import 'package:exam_app/core/local_secure_storage/flutter_secure_storage.dart';
import 'package:exam_app/features/login/data/datasource/local_dataSource/local_dataSource_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LocalDatasourceContract)
class LocalDatasourceImpl extends LocalDatasourceContract {
  final LocalStroage localStroage;
  LocalDatasourceImpl(this.localStroage);
  @override
  Future<void> saveUserToken(String tokenValue) async {
    localStroage.saveToken(key: 'token', value: tokenValue);
  }

  @override
  Future<String?> getUserToken(String key) async {
    return localStroage.getToken(key: key);
  }
}
