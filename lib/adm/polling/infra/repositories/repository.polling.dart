import 'package:soares_administradora_condominios/adm/polling/domain/entity/polling.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/entity/response.polling.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/irepositories/irepository.polling.dart';
import 'package:soares_administradora_condominios/adm/polling/infra/adapters/json.to.from.polling.dart';
import 'package:soares_administradora_condominios/adm/polling/infra/adapters/json.to.from.response.polling.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/infra/datasource/datasource.polling.dart';

class PollingRepository implements IPollingRepository {
  final IPollingDataSource pollingDataSource;
  PollingRepository(this.pollingDataSource);

  @override
  Stream<List<PollingEntity>> getAllPolling() {
    final streamList = pollingDataSource.getAllPolling();
    return streamList.map(_convert);
  }

  List<PollingEntity> _convert(List<dynamic> list) {
    return list.map(JsonToFromPollingEntity.fromMap).toList();
  }

  @override
  Future<void> answerPolling(String uid, List<ResponsePollingEntity> listResponsePollingsUser,
      ResponsePollingEntity responsePolling, PollingEntity polling) async {
    final mapPolling = JsonToFromPollingEntity.toMap(polling);
    final mapList = listResponsePollingsUser.map(JsonToFromResponsePollingEntity.toMap).toList();
    final mapResponse = JsonToFromResponsePollingEntity.toMap(responsePolling);
    await pollingDataSource.answerPolling(
        uid, mapList, mapResponse, mapPolling);
  }
}
