
import 'package:soares_administradora_condominios/adm/polling/domain/entity/polling.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/entity/response.polling.entity.dart';

abstract class IPollingRepository {
  Stream<List<PollingEntity>> getAllPolling();

  Future<void> answerPolling(
      String uid,
      List<ResponsePollingEntity> listResponsePollingsUser,
      ResponsePollingEntity responsePolling,
      PollingEntity polling);
}
