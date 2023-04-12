import 'package:soares_administradora_condominios/user/domain/irepositories/irepository.user.unit.dart';

abstract class IUpdateValueUser {
  Future<void> call(String library, String key, dynamic data);
}

class UpdateValueUser implements IUpdateValueUser {
  final IUserRepository repository;

  UpdateValueUser(this.repository);
  @override
  Future<void> call(String library, String key, dynamic data) async {
    await repository.updateValueUser(library, key, data);
  }
}
