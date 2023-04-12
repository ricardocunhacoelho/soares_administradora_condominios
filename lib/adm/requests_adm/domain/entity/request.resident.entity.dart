import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.entity.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

class RequestResidentEntity implements RequestsAdmEntity {
  final String id;
  final DateTime date;
  final bool completed;
  final ERequestType requestType;
  final ResidentEntity resident;

  RequestResidentEntity({
    required this.id,
    required this.date,
    required this.completed,
    required this.requestType,
    required this.resident,
  });
}
