import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/person/person.object.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';

class ToFromPersonObject {
  static List<PersonObject> ResidentToPerson(
      List<ResidentEntity> residentList) {
    return residentList
        .map((e) => PersonObject(
            name: e.name,
            ePersonType: EPersonType.morador,
            cpf: e.cpf,
            phoneNumber: e.phoneNumber,
            unit: e.unit,
            qrData: 'residents/${e.id}'))
        .toList();
  }

  static List<PersonObject> VisitorsToPerson(List<VisitorEntity> visitorsList) {
    return visitorsList
        .map((e) => PersonObject(
            name: e.name,
            ePersonType: EPersonType.visita,
            cpf: e.cpf,
            phoneNumber: e.phoneNumber,
            unit: e.unit,
            qrData: 'visitors/${e.cpf}'))
        .toList();
  }

  static List<PersonObject> HouseServiceProviderToPerson(
      List<HouseServiceProviderEntity> houseServiceProviderList) {
    return houseServiceProviderList
        .map((e) => PersonObject(
            name: e.name,
            ePersonType: EPersonType.funcionario,
            cpf: e.cpf,
            phoneNumber: e.phoneNumber,
            unit: e.unit,
            qrData: 'house_service_providers/${e.cpf}'))
        .toList();
  }
}
