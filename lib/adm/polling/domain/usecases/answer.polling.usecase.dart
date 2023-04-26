import 'package:soares_administradora_condominios/adm/polling/domain/entity/polling.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/entity/response.polling.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/irepositories/irepository.polling.dart';

abstract class IAnswerPolling {
  Future<void> call(String uid, List<ResponsePollingEntity> listResponsePollingsUser,
      ResponsePollingEntity responsePolling, PollingEntity polling);
}

class AnswerPolling implements IAnswerPolling {
  final IPollingRepository repository;

  AnswerPolling(this.repository);
  @override
  Future<void> call(String uid, List<ResponsePollingEntity> listResponsePollingsUser,
      ResponsePollingEntity responsePolling, PollingEntity polling) {
    return repository.answerPolling(
        uid, listResponsePollingsUser, responsePolling, polling);
  }
}
