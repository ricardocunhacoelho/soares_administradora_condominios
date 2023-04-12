import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';

abstract class MyHouseStates {}

abstract class FetchStates {}

class InitialMyHouseState implements MyHouseStates {}

class InitialFetchStates implements FetchStates {}

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

class LoadingFetchHomeUnitFetchStates implements FetchStates {}

class CompleteFetchHomeUnitFetchStates implements FetchStates {
  final HomeUnitEntity homeUnitEntity;

  CompleteFetchHomeUnitFetchStates(this.homeUnitEntity);
}

class ErrorFetchHomeUnitFetchStates implements FetchStates {
  final String message;

  ErrorFetchHomeUnitFetchStates(this.message);
}

class RegisterVehicleLoadingMyHouseState implements MyHouseStates {}

class RegisterVehicleErrorMyHouseState implements MyHouseStates {}

class RegisterVehicleCompleteMyHouseState implements MyHouseStates {}

class DeleteVehicleLoadingMyHouseState implements MyHouseStates {}

class DeleteVehicleErrorMyHouseState implements MyHouseStates {}

class DeleteVehicleCompleteMyHouseState implements MyHouseStates {}

class DeleteVisitorLoadingMyHouseState implements MyHouseStates {}

class DeleteVisitorErrorMyHouseState implements MyHouseStates {}

class DeleteVisitorCompleteMyHouseState implements MyHouseStates {}

class RegisterVisitorLoadingMyHouseState implements MyHouseStates {}

class RegisterVisitorErrorMyHouseState implements MyHouseStates {}

class RegisterVisitorCompleteMyHouseState implements MyHouseStates {}

class RegisterHouseServiceProviderLoadingMyHouseState implements MyHouseStates {}

class RegisterHouseServiceProviderErrorMyHouseState implements MyHouseStates {}

class RegisterHouseServiceProviderCompleteMyHouseState implements MyHouseStates {}

class DeleteHouseServiceProviderLoadingMyHouseState implements MyHouseStates {}

class DeleteHouseServiceProviderErrorMyHouseState implements MyHouseStates {}

class DeleteHouseServiceProviderCompleteMyHouseState implements MyHouseStates {}

class UpdateVisitorLoadingMyHouseState implements MyHouseStates {}

class UpdateVisitorCompleteMyHouseState implements MyHouseStates {}

class UpdateVisitorErrorMyHouseState implements MyHouseStates {}

class UpdateHouseServiceProviderLoadingMyHouseState implements MyHouseStates {}

class UpdateHouseServiceProviderCompleteMyHouseState implements MyHouseStates {}

class UpdateHouseServiceProviderErrorMyHouseState implements MyHouseStates {}