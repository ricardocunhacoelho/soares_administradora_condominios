import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/resident/domain/irepository/irepository.resident.dart';
import 'package:soares_administradora_condominios/resident/infra/adapters/json.to.from.resident.entity.dart';
import 'package:soares_administradora_condominios/resident/infra/datasource/datasource.resident.dart';

class ResidentRepository implements IResidentRepository {
  final IResidentDataSource residentDataSource;
  ResidentRepository(this.residentDataSource);

  @override
  Future<void> registerResident(ResidentEntity resident) async {
    final mapResident = JsonToFromResidentEntity.toMap(resident);
    await residentDataSource.registerResident(mapResident);
  }

  @override
  Future<void> updateValueResident(
      ResidentEntity residentEntity, int index) async {
    final mapResident = JsonToFromResidentEntity.toMap(residentEntity);
    await residentDataSource.updateValueResident(mapResident, index);
  }
  
  @override
  Future<void> deleteResident(String cpf, int index) async {
    await residentDataSource.deleteResident(cpf, index);
  }
}
