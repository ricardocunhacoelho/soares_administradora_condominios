import 'package:soares_administradora_condominios/login/auth.result.dart';

abstract class AuthInterface {
  Future<AuthResult> login(String user, String pass);
  Future<AuthResult> register(String user, String pass);
}