
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';

abstract class LoginStates {}

abstract class FetchUserStates {}

class InitialLoginState implements LoginStates {}

class ChangeProfileImageState implements LoginStates {}

class ChangeProfileImageCompleteState implements LoginStates {}

class InitialFetchUserState implements FetchUserStates {}

class LoadingFetchUserLoginState implements FetchUserStates {}

class CompleteFetchUserResidentLoginState implements FetchUserStates {
  final ResidentEntity resident;

  CompleteFetchUserResidentLoginState(this.resident);
}

class CompleteFetchUserWorkerLoginState implements FetchUserStates {
  final WorkerEntity worker;

  CompleteFetchUserWorkerLoginState(this.worker);

}

class ErrorFetchUserLoginState implements FetchUserStates {
  final String message;

  ErrorFetchUserLoginState(this.message);
}

class AuthenticateUserLoadingLoginState implements LoginStates {}

class AuthenticateUserCompleteLoginState implements LoginStates {}

class AuthenticateUserErrorLoginState implements LoginStates {
  final String message;

  AuthenticateUserErrorLoginState(this.message);
}
