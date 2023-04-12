import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.entity.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.resident.entity.dart';

abstract class IRequestsAdmRepository {
  Future<void> addRequestResident(
      RequestResidentEntity requestesidentEntity, ERequestType type);
}
