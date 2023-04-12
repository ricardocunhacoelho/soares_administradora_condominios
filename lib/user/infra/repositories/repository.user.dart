import 'package:image_picker/image_picker.dart';

import 'package:soares_administradora_condominios/home_unit/infra/adapters/json.to.from.home.unit.adapter.dart';
import 'package:soares_administradora_condominios/login/auth.result.dart';
import 'package:soares_administradora_condominios/resident/infra/adapters/json.to.from.resident.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/user/domain/irepositories/irepository.user.unit.dart';
import 'package:soares_administradora_condominios/user/domain/valueobjects/result.upload.image.value.object.dart';
import 'package:soares_administradora_condominios/user/infra/datasource/datasource.user.dart';
import 'package:soares_administradora_condominios/worker/infra/adapters/json.to.from.worker.entity.adapter.dart';

class UserRepository implements IUserRepository {
  final IUserDataSource userDataSource;
  UserRepository(this.userDataSource);

  @override
  Future<AuthResult> authenticateUser(String email, String pass) async {
    if (_isValidsInputs(email, pass)) {
      return await userDataSource.authenticateUser(email, pass);
    } else {
      return AuthResult(msgError: 'Não autenticado, entradas inválidas');
    }
  }

  bool _isValidsInputs(String user, String pass) =>
      user.isNotEmpty && pass.isNotEmpty && pass.length >= 6;

  @override
  Stream<UserEntity> fetchUser(String uid) {
    final streamMap = userDataSource.fetchUser(uid);
    return streamMap.map(_convert);
  }

  UserEntity _convert(Map<dynamic, dynamic> map) {
    return map['userType'] == 'resident'
        ? JsonToFromResidentEntity.fromMap(map)
        : JsonToFromWorkerEntity.fromMap(map);
  }

  @override
  Future<ResultUploadImageValueObject> addProfileImageUser() async {
    XFile? file = await getImage();
    if (file != null) {
      return await userDataSource.addProfileImageUser(file.path);
    } else {
      return ResultUploadImageValueObject(
        msgError: 'erro ao pegar caminho da imagem',
        task: null,
      );
    }
  }

  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  @override
  Future<void> updateValueUser(String library, String key, dynamic data) async {
    await userDataSource.updateValueUser(library, key, data);
  }

  @override
  Future<ResultUploadImageValueObject> deleteProfileImageUser() async {
    XFile? file = await getImage();
    if (file != null) {
      await userDataSource.deleteProfileImageUser();
      return await userDataSource.addProfileImageUser(file.path);
    } else {
      return ResultUploadImageValueObject(
        msgError: 'erro ao pegar caminho da imagem',
        task: null,
      );
    }
  }
}
