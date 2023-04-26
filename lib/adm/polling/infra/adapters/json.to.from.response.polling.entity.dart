import 'package:soares_administradora_condominios/adm/polling/domain/entity/response.polling.entity.dart';

class JsonToFromResponsePollingEntity {
  static Map<String, dynamic> toMap(ResponsePollingEntity responsePolling) {
    return {
      'id_polling': responsePolling.idPolling,
      'pollingChange': responsePolling.pollingChange,
      'vote': responsePolling.vote,
    };
  }

  static ResponsePollingEntity fromMap(dynamic json) {
    return ResponsePollingEntity(
      idPolling: json['id_polling'],
      pollingChange: json['pollingChange'],
      vote: json['vote'],
    );
  }
}
