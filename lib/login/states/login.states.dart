import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';

abstract class LoginStates {}

class InitialLoginState implements LoginStates {}

class LoadingFetchHomeUnitLoginState implements LoginStates {}

class CompleteFetchHomeUnitLoginState implements LoginStates {
  final HomeUnitEntity homeUnitEntity;

  CompleteFetchHomeUnitLoginState(this.homeUnitEntity);
}

class ErrorFetchHomeUnitLoginState implements LoginStates {
  final String message;

  ErrorFetchHomeUnitLoginState(this.message);
}

class AuthenticateHomeUnitLoadingLoginState implements LoginStates {}

class AuthenticateHomeUnitCompleteLoginState implements LoginStates {}

class AuthenticateHomeUnitErrorLoginState implements LoginStates {}
