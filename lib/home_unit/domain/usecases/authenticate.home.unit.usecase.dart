
import 'package:soares_administradora_condominios/home_unit/domain/irepositories/irepository.home.unit.dart';
import 'package:soares_administradora_condominios/login/auth.result.dart';

abstract class IAuthenticateHomeUnit{
  Future<AuthResult> call(String email, String pass);
}
class AuthenticateHomeUnit implements IAuthenticateHomeUnit {
  final IHomeUnitRepository repository;

  AuthenticateHomeUnit(this.repository);
  @override
  Future<AuthResult> call(String email, String pass) async {
    return await repository.authenticateHomeUnit(email, pass);
  }
}
