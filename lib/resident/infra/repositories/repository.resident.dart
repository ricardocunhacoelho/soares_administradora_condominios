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
}
