import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.entity.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/usecases/add.request.access.resident.usecase.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/usecases/generate.request.access.resident.usecase.dart';
import 'package:soares_administradora_condominios/home_unit/domain/usecases/fetch.home.unit.usecase.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:soares_administradora_condominios/resident/domain/usecases/delete.resident.usecase.dart';
import 'package:soares_administradora_condominios/resident/domain/usecases/register.resident.usecase.dart';
import 'package:soares_administradora_condominios/resident/domain/usecases/update.value.resident.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/add.profile.image.user.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/delete.profile.image.user.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/update.value.user.usecase.dart';
import 'package:soares_administradora_condominios/vehicle/domain/usecases/delete.vehicle.usecase.dart';
import 'package:soares_administradora_condominios/vehicle/domain/usecases/register.vehicle.usecase.dart';

class MyHouseBloc extends Bloc<MyHouseEvents, MyHouseStates> {
  final IAddProfileImageUser addProfileImageUserUsecase;
  final IUpdateValueUser updateValueUserUsecase;
  final IDeleteProfileImageUser deleteProfileImageUserUsecase;
  final IRegisterResident registerResidentUsecase;
  final IUpdateValueResident updateValueResidentUsecase;
  final IDeleteResident deleteResidentUsecase;
  final IFetchHomeUnit fetchHomeUnitUsecase;
  final IAddRequestResident addRequestResidentUsecase;
  final IGenerateRequestResident generateRequestResidentUsecase;
  final IRegisterVehicle registerVehicleUsecase;
  final IDeleteVehicle deleteVehicleUsecase;

  MyHouseBloc(
    this.addProfileImageUserUsecase,
    this.updateValueUserUsecase,
    this.deleteProfileImageUserUsecase,
    this.registerResidentUsecase,
    this.updateValueResidentUsecase,
    this.deleteResidentUsecase,
    this.fetchHomeUnitUsecase,
    this.addRequestResidentUsecase,
    this.generateRequestResidentUsecase,
    this.registerVehicleUsecase,
    this.deleteVehicleUsecase,
  ) : super(InitialMyHouseState()) {
    on<UpdateValueUserMyHouseEvent>(_updateValueUserMyHouseEvent,
        transformer: sequential());
    on<RegisterResidentMyHouseEvent>(_registerResidentMyHouseEvent,
        transformer: sequential());
    on<UpdateValueResidentMyHouseEvent>(_updateValueResidentMyHouseEvent,
        transformer: sequential());
    on<DeleteResidentMyHouseEvent>(_deleteResidentMyHouseEvent,
        transformer: sequential());
    on<RegisterVehicleMyHouseEvent>(_registerVehicleMyHouseEvent,
        transformer: sequential());
    on<DeleteVehicleMyHouseEvent>(_deleteVehicleMyHouseEvent,
        transformer: sequential());
  }

  Future<void> _updateValueUserMyHouseEvent(
      UpdateValueUserMyHouseEvent event, Emitter<MyHouseStates> emit) async {
    emit(UpdateValueUserLoadingMyHouseState());
    await updateValueUserUsecase.call(event.library, event.key, event.data);
    emit(UpdateValueUserCompleteMyHouseState());
  }

  Future<void> _registerResidentMyHouseEvent(
      RegisterResidentMyHouseEvent event, Emitter<MyHouseStates> emit) async {
    emit(RegisterResidentLoadingMyHouseState());
    await registerResidentUsecase.call(event.resident);
    final requestAccess = generateRequestResidentUsecase.call(
        event.resident, ERequestType.access);
    await addRequestResidentUsecase.call(requestAccess, ERequestType.access);
    emit(RegisterResidentCompleteMyHouseState());
  }

  Future<void> _updateValueResidentMyHouseEvent(
      UpdateValueResidentMyHouseEvent event,
      Emitter<MyHouseStates> emit) async {
    emit(UpdateValueResidentLoadingMyHouseState());
    await updateValueResidentUsecase.call(event.residentEntity, event.index);
    emit(UpdateValueResidentCompleteMyHouseState());
  }

  Future<void> _deleteResidentMyHouseEvent(
      DeleteResidentMyHouseEvent event, Emitter<MyHouseStates> emit) async {
    emit(DeleteResidentLoadingMyHouseState());
    final requestDelete = generateRequestResidentUsecase.call(
        event.resident, ERequestType.delete);
    await addRequestResidentUsecase.call(requestDelete, ERequestType.delete);
    emit(DeleteResidentCompleteMyHouseState());
  }

  Future<void> _registerVehicleMyHouseEvent(
      RegisterVehicleMyHouseEvent event, Emitter<MyHouseStates> emit) async {
    emit(RegisterVehicleLoadingMyHouseState());
    await registerVehicleUsecase.call(event.vehicle, event.idUnit);
    emit(RegisterVehicleCompleteMyHouseState());
  }

  Future<void> _deleteVehicleMyHouseEvent(
      DeleteVehicleMyHouseEvent event, Emitter<MyHouseStates> emit) async {
    emit(DeleteVehicleLoadingMyHouseState());
    await deleteVehicleUsecase.call(event.idUnit, event.vehicle.plate, event.index);
    emit(DeleteVehicleCloseMyHouseState());
    emit(DeleteVehicleCompleteMyHouseState());
  }
}
