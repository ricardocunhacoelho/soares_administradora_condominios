
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/resident/domain/irepository/irepository.resident.dart';

abstract class IRegisterResident{
  Future<void> call(ResidentEntity resident);
}
class RegisterResident implements IRegisterResident {
  final IResidentRepository repository;

  RegisterResident(this.repository);
  @override
  Future<void> call(ResidentEntity resident) async {
    await repository.registerResident(resident);
  }
}
