import 'package:soares_administradora_condominios/login/auth.result.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';

abstract class IUserRepository {

  Future<AuthResult> authenticateUser(String email, String pass);

  Stream<UserEntity> fetchUser(String uid);
  
}
