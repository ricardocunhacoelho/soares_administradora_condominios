
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/user/domain/irepositories/irepository.user.unit.dart';

abstract class IFetchUser {
  Stream<UserEntity> call(String uid);
}

class FetchUser implements IFetchUser {
  final IUserRepository repository;

  FetchUser(this.repository);
  @override
  Stream<UserEntity> call(String uid)  {
    return repository.fetchUser(uid);
  }
}