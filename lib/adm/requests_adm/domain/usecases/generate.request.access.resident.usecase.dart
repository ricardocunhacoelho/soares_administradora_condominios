import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.resident.entity.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.entity.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

abstract class IGenerateRequestResident {
  RequestResidentEntity call(
      ResidentEntity residentEntity, ERequestType type);
}

class GenerateRequestResident implements IGenerateRequestResident {
  @override
  RequestResidentEntity call(
      ResidentEntity residentEntity, ERequestType type) {
    return RequestResidentEntity(
        id: 'access${residentEntity.cpf}',
        date: DateTime.now(),
        completed: false,
        requestType: type,
        resident: residentEntity);
  }
}
