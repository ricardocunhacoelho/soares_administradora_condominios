
import 'package:soares_administradora_condominios/user/domain/irepositories/irepository.user.unit.dart';
import 'package:soares_administradora_condominios/user/domain/valueobjects/result.upload.image.value.object.dart';

abstract class IDeleteProfileImageUser{
  Future<ResultUploadImageValueObject> call();
}
class DeleteProfileImageUser implements IDeleteProfileImageUser {
  final IUserRepository repository;

  DeleteProfileImageUser(this.repository);
  @override
  Future<ResultUploadImageValueObject> call() async {
    return await repository.deleteProfileImageUser();
  }
}
