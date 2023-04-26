import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/entity/task.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/employee/domain/entity/employee.entity.dart';
import 'package:soares_administradora_condominios/adm/lost_found/domain/entity/lost.found.entity.dart';
import 'package:soares_administradora_condominios/adm/news_wall/domain/entity/news.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/entity/polling.entity.dart';

abstract class CondominiumStates {}

abstract class GetNewsWallStates {}

abstract class GetTaskCondominiumStates {}

abstract class GetLostFoundStates {}

abstract class GetEmployeeStates {}

abstract class GetPollingStates {}

abstract class PollingStates {}

abstract class CalledStates {}

abstract class MaintenanceStates {}

class InitialNewsWallState implements GetNewsWallStates {}

class LoadingGetNewsWallState implements GetNewsWallStates {}

class CompleteGetNewsWallState implements GetNewsWallStates {
  final List<NewsEntity> newsList;

  CompleteGetNewsWallState(this.newsList);
}

class ErrorGetNewsWallState implements GetNewsWallStates {
  final String message;

  ErrorGetNewsWallState(this.message);
}

class InitialTaskCondominiumState implements GetTaskCondominiumStates {}

class LoadingGetTaskCondominiumState implements GetTaskCondominiumStates {}

class CompleteGetTaskCondominiumState implements GetTaskCondominiumStates {
  final List<TaskCondominiumEntity> taskList;

  CompleteGetTaskCondominiumState(this.taskList);
}

class ErrorGetTaskCondominiumState implements GetTaskCondominiumStates {
  final String message;

  ErrorGetTaskCondominiumState(this.message);
}

class InitialLostFoundState implements GetLostFoundStates {}

class LoadingGetLostFoundState implements GetLostFoundStates {}

class CompleteGetLostFoundState implements GetLostFoundStates {
  final List<LostFoundEntity> lostFoundList;

  CompleteGetLostFoundState(this.lostFoundList);
}

class ErrorGetLostFoundState implements GetLostFoundStates {
  final String message;

  ErrorGetLostFoundState(this.message);
}

class InitialEmployeeState implements GetEmployeeStates {}

class LoadingGetEmployeeState implements GetEmployeeStates {}

class CompleteGetEmployeeState implements GetEmployeeStates {
  final List<EmployeeEntity> employeeList;

  CompleteGetEmployeeState(this.employeeList);
}

class ErrorGetEmployeeState implements GetEmployeeStates {
  final String message;

  ErrorGetEmployeeState(this.message);
}

class InitialPollingState implements GetPollingStates {}

class LoadingGetPollingState implements GetPollingStates {}

class CompleteGetPollingState implements GetPollingStates {
  final List<PollingEntity> pollingList;

  CompleteGetPollingState(this.pollingList);
}

class ErrorGetPollingState implements GetPollingStates {
  final String message;

  ErrorGetPollingState(this.message);
}

class InitialPollingsState implements PollingStates {}

class LoadingAnswerPollingState implements PollingStates {}

class CompleteAnswerPollingState implements PollingStates {}

class ErrorAnswerPollingState implements PollingStates {
  final String message;

  ErrorAnswerPollingState(this.message);
}

class InitialCalledState implements CalledStates {}

class LoadingSendCalledState implements CalledStates {}

class CompleteSendCalledState implements CalledStates {}

class ErrorSendCalledState implements CalledStates {
  final String message;

  ErrorSendCalledState(this.message);
}

class InitialMaintenanceState implements MaintenanceStates {}

class LoadingRequestMaintenanceState implements MaintenanceStates {}

class CompleteRequestMaintenanceState implements MaintenanceStates {}

class ErrorRequestMaintenanceState implements MaintenanceStates {
  final String message;

  ErrorRequestMaintenanceState(this.message);
}