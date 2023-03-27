import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

abstract class IResidentDataSource {
  Future<void> registerResident(Map<String, dynamic> residentMap);
}
