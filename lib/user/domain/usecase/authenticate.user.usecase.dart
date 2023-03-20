
import 'package:soares_administradora_condominios/login/auth.result.dart';
import 'package:soares_administradora_condominios/user/domain/irepositories/irepository.user.unit.dart';

abstract class IAuthenticateUser{
  Future<AuthResult> call(String email, String pass);
}
class AuthenticateUser implements IAuthenticateUser {
  final IUserRepository repository;

  AuthenticateUser(this.repository);
  @override
  Future<AuthResult> call(String email, String pass) async {
    return await repository.authenticateUser(email, pass);
  }
}
