import 'package:soares_administradora_condominios/login/auth.result.dart';
import 'package:soares_administradora_condominios/user/domain/valueobjects/result.upload.image.value.object.dart';

abstract class IUserDataSource {
  Future<AuthResult> authenticateUser(String email, String pass);
  Stream<Map> fetchUser(String uid);
  Future<ResultUploadImageValueObject> addProfileImageUser(String path);
  Future<void> updateValueUser(String library, String key, dynamic data);
  Future<void> deleteProfileImageUser();
}
