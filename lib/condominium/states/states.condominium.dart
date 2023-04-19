

import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/entity/task.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/news_wall/domain/entity/news.entity.dart';

abstract class CondominiumStates {}

abstract class GetNewsWallStates {}

abstract class GetTaskCondominiumStates {}

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

