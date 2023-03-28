
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/resident/domain/irepository/irepository.resident.dart';

abstract class IUpdateValueResident {
  Future<void> call(ResidentEntity residentEntity,int index);
}

class UpdateValueResident implements IUpdateValueResident {
  final IResidentRepository repository;

  UpdateValueResident(this.repository);
  @override
  Future<void> call(ResidentEntity residentEntity,int index) async {
    await repository.updateValueResident(residentEntity, index);
  }
}
