import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.resident.entity.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.entity.dart';
import 'package:soares_administradora_condominios/resident/infra/adapters/json.to.from.resident.entity.dart';


class JsonToFromRequestResidentEntity {
  static Map<String, dynamic> toMap(
      RequestResidentEntity requestResidentEntity) {
    return {
      'id': requestResidentEntity.id,
      'date': requestResidentEntity.date.toIso8601String(),
      'completed': requestResidentEntity.completed,
      'requestType': requestResidentEntity.requestType.name,
      'resident':
          JsonToFromResidentEntity.toMap(requestResidentEntity.resident),
    };
  }

  static RequestResidentEntity fromMap(dynamic json) {
    return RequestResidentEntity(
      id: json['id'],
      date: DateTime.parse(json['date']),
      completed: json['completed'],
      requestType: ERequestType.values.firstWhere(
        (element) => element.name == json['requestType'],
      ),
      resident: JsonToFromResidentEntity.fromMap(json['resident']),
    );
  }
}
