
import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';

abstract class LoginStates {}

class InitialLoginState implements LoginStates {}

class LoadingFetchUserLoginState implements LoginStates {}

class CompleteFetchUserHomeUnitLoginState implements LoginStates {
  final HomeUnitEntity homeUnitEntity;

  CompleteFetchUserHomeUnitLoginState(this.homeUnitEntity);

}

class CompleteFetchUserWorkerLoginState implements LoginStates {
  final WorkerEntity workerEntity;

  CompleteFetchUserWorkerLoginState(this.workerEntity);

}

class ErrorFetchUserLoginState implements LoginStates {
  final String message;

  ErrorFetchUserLoginState(this.message);
}

class AuthenticateUserLoadingLoginState implements LoginStates {}

class AuthenticateUserCompleteLoginState implements LoginStates {}

class AuthenticateUserErrorLoginState implements LoginStates {
  final String message;

  AuthenticateUserErrorLoginState(this.message);
}
