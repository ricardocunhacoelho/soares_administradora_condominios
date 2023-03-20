import 'package:soares_administradora_condominios/home_unit/infra/adapters/json.to.from.home.unit.adapter.dart';
import 'package:soares_administradora_condominios/login/auth.result.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/user/domain/irepositories/irepository.user.unit.dart';
import 'package:soares_administradora_condominios/user/infra/datasource/datasource.user.dart';
import 'package:soares_administradora_condominios/worker/infra/adapters/json.to.from.worker.entity.adapter.dart';

class UserRepository implements IUserRepository {
  final IUserDataSource userDataSource;
  UserRepository(this.userDataSource);

  @override
  Future<AuthResult> authenticateUser(String email, String pass) async {
    if (_isValidsInputs(email, pass)) {
    return await userDataSource.authenticateUser(email, pass);
    }else{
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
      
    return map['userType'] == 'homeUnit' ? JsonToFromHomeUnitEntity.fromMap(map) : JsonToFromWorkerEntity.fromMap(map);
  }
}
