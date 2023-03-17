
import 'package:soares_administradora_condominios/home_unit/domain/irepositories/irepository.home.unit.dart';

abstract class IAuthenticateHomeUnit{
  Future<void> call(String email, String pass);
}
class AuthenticateHomeUnit implements IAuthenticateHomeUnit {
  final IHomeUnitRepository repository;

  AuthenticateHomeUnit(this.repository);
  @override
  Future<void> call(String email, String pass) async {
    await repository.authenticateHomeUnit(email, pass);
  }
}
