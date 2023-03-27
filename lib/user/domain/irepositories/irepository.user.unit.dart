
import 'package:soares_administradora_condominios/login/auth.result.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/user/domain/valueobjects/result.upload.image.value.object.dart';

abstract class IUserRepository {
  Future<AuthResult> authenticateUser(String email, String pass);
  Stream<UserEntity> fetchUser(String uid);
  Future<ResultUploadImageValueObject> addProfileImageUser();
  Future<void> updateValueUser(String library, dynamic data);
  Future<ResultUploadImageValueObject> deleteProfileImageUser();
}
