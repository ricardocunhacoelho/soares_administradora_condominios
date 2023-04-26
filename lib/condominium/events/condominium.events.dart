import 'package:soares_administradora_condominios/adm/called_condominium/domain/entity/called.entity.dart';
import 'package:soares_administradora_condominios/adm/maintenance/domain/entity/maintenance.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/entity/polling.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/entity/response.polling.entity.dart';

abstract class MyHouseEvents {}

abstract class GetNewsWallEvents {}

abstract class GetTaskCondominiumEvents {}

abstract class GetLostFoundEvents {}

abstract class GetEmployeeEvents {}

abstract class GetPollingEvents {}

abstract class PollingEvents {}

abstract class CalledEvents {}

abstract class MaintenanceEvents {}

class GetNewsWallEvent implements GetNewsWallEvents {}

class GetAllTaskCondominiumEvent implements GetTaskCondominiumEvents {}

class GetAllLostFoundEvent implements GetLostFoundEvents {}

class GetAllEmployeeEvent implements GetEmployeeEvents {}

class GetAllPollingEvent implements GetPollingEvents {}

class SendCalledEvent implements CalledEvents {
  final CalledEntity called;

  SendCalledEvent(this.called);
}

class InitCalledEvent implements CalledEvents {}

class RequestMaintenanceEvent implements MaintenanceEvents {
  final MaintenanceEntity maintenance;

  RequestMaintenanceEvent(this.maintenance);
}

class AnswerPollingEvent implements PollingEvents {
  final String uid;
  final List<ResponsePollingEntity> listPollingsUser;
  final ResponsePollingEntity responsePolling;
  final PollingEntity polling;
  AnswerPollingEvent(
      this.uid, this.listPollingsUser, this.responsePolling, this.polling);
}
