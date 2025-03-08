import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalStroage {
  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));
  void saveToken({required String key, required String value}) async{
    await storage.write(key: key, value: value);
  }

  Future<String?> getToken({required String key}) async{
    return  await storage.read(key: key);
  }
}
