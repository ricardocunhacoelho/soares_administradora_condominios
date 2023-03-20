import 'package:soares_administradora_condominios/login/auth.result.dart';

abstract class IUserDataSource {
  Future<AuthResult> authenticateUser(String email, String pass);
  Stream<Map> fetchUser(String uid);
}
