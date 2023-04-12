
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';

abstract class LoginStates {}

class InitialLoginState implements LoginStates {}

class LoadingFetchUserLoginState implements LoginStates {}

class CompleteFetchUserResidentLoginState implements LoginStates {
  final ResidentEntity resident;

  CompleteFetchUserResidentLoginState(this.resident);
}

class CompleteFetchUserWorkerLoginState implements LoginStates {
  final WorkerEntity worker;

  CompleteFetchUserWorkerLoginState(this.worker);

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
