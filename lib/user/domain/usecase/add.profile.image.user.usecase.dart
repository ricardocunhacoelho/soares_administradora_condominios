
import 'package:soares_administradora_condominios/user/domain/irepositories/irepository.user.unit.dart';
import 'package:soares_administradora_condominios/user/domain/valueobjects/result.upload.image.value.object.dart';

abstract class IAddProfileImageUser{
  Future<ResultUploadImageValueObject> call();
}
class AddProfileImageUser implements IAddProfileImageUser {
  final IUserRepository repository;

  AddProfileImageUser(this.repository);
  @override
  Future<ResultUploadImageValueObject> call() async {
    return await repository.addProfileImageUser();
  }
}
