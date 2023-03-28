
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

abstract class IResidentRepository {

  Future<void> registerResident(ResidentEntity resident);

  Future<void> updateValueResident(ResidentEntity residentEntity, int index);

  Future<void> deleteResident(String cpf, int index); 
}
