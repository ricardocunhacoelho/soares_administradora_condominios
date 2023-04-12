import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.entity.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.resident.entity.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/irepositories/irespository.requests.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/infra/adapters/json.to.from.request.access.entity.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/infra/datasource/datasource.requests.dart';

class RequestsAdmRepository implements IRequestsAdmRepository {
  final IRequestsAdmDataSource requestsAdmDataSource;
  RequestsAdmRepository(this.requestsAdmDataSource);

  @override
  Future<void> addRequestResident(
      RequestResidentEntity requestResidentEntity, ERequestType type) async {
    final typeName = type.name;
    final mapRequestResident = JsonToFromRequestResidentEntity.toMap(
        requestResidentEntity);
    await requestsAdmDataSource
        .addRequestResident(mapRequestResident, typeName);
  }
}
