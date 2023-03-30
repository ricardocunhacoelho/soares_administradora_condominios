import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';

abstract class MyHouseStates {}

class InitialMyHouseState implements MyHouseStates {}

class UpdateValueUserLoadingMyHouseState implements MyHouseStates {}

class UpdateValueUserInitialMyHouseState implements MyHouseStates {}

class UpdateValueUserMainErrorMyHouseState implements MyHouseStates {}

class UpdateValueUserCompleteMyHouseState implements MyHouseStates {}

class UpdateValueUserErrorMyHouseState implements MyHouseStates {
  final String message;

  UpdateValueUserErrorMyHouseState(this.message);
}

class RegisterResidentLoadingMyHouseState implements MyHouseStates {}

class RegisterResidentErrorMyHouseState implements MyHouseStates {}

class RegisterResidentCompleteMyHouseState implements MyHouseStates {}

class UpdateValueResidentLoadingMyHouseState implements MyHouseStates {}

class UpdateValueResidentCompleteMyHouseState implements MyHouseStates {}

class UpdateValueResidentErrorMyHouseState implements MyHouseStates {}

class DeleteResidentLoadingMyHouseState implements MyHouseStates {}

class DeleteResidentCompleteMyHouseState implements MyHouseStates {}

class LoadingFetchHomeUnitMyHouseState implements MyHouseStates {}

class CompleteFetchHomeUnitMyHouseState implements MyHouseStates {
  final HomeUnitEntity homeUnitEntity;

  CompleteFetchHomeUnitMyHouseState(this.homeUnitEntity);
}

class ErrorFetchHomeUnitMyHouseState implements MyHouseStates {
  final String message;

  ErrorFetchHomeUnitMyHouseState(this.message);
}