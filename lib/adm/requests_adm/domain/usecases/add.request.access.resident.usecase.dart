import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.entity.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.resident.entity.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/irepositories/irespository.requests.dart';

abstract class IAddRequestResident {
  Future<void> call(
      RequestResidentEntity requestResidentEntity, ERequestType type);
}

class AddRequestResident implements IAddRequestResident {
  final IRequestsAdmRepository repository;

  AddRequestResident(this.repository);
  @override
  Future<void> call(
      RequestResidentEntity requestResidentEntity, ERequestType type) {
    return repository.addRequestResident(requestResidentEntity, type);
  }
}
