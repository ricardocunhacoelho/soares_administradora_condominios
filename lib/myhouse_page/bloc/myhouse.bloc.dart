import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.entity.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/usecases/add.request.access.resident.usecase.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/usecases/generate.request.access.resident.usecase.dart';
import 'package:soares_administradora_condominios/home_unit/domain/usecases/fetch.home.unit.usecase.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/usecases/delete.house.service.provider.usecase.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/usecases/register.house.service.provider.usecase.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/usecases/update.value.hosue.service.provider.usecase.dart';
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
import 'package:soares_administradora_condominios/visitor/domain/usecases/delete.visitor.usecase.dart';
import 'package:soares_administradora_condominios/visitor/domain/usecases/update.value.visitor.usecase.dart';
import 'package:soares_administradora_condominios/visitor/domain/usecases/visitor.register.usecase.dart';

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
  final IRegisterVisitor registerVisitorUsecase;
  final IRegisterHouseServiceProvider registerHouseServiceProviderUsecase;
  final IUpdateValueVisitor updateValueVisitorUsecase;
  final IDeleteVisitor deleteVisitorUsecase;
  final IUpdateValueHouseServiceProvider updateValueHouseServiceProviderUsecase;
  final IDeleteHouseServiceProvider deleteHouseServiceProviderUsecase;

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
    this.registerVisitorUsecase,
    this.registerHouseServiceProviderUsecase,
    this.updateValueVisitorUsecase,
    this.deleteVisitorUsecase,
    this.updateValueHouseServiceProviderUsecase,
    this.deleteHouseServiceProviderUsecase,
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
    on<RegisterVisitorMyHouseEvent>(_registerVisitorMyHouseEvent,
        transformer: sequential());
    on<RegisterHouseServiceProviderMyHouseEvent>(
        _registerHouseServiceProviderMyHouseEvent,
        transformer: sequential());
    on<UpdateValueVisitorEvent>(_updateValueVisitorEvent,
        transformer: sequential());
    on<DeleteVisistorMyHouseEvent>(_deleteVisistorMyHouseEvent,
        transformer: sequential());
    on<UpdateValueHouseServiceProviderEvent>(
        _updateValueHouseServiceProviderEvent,
        transformer: sequential());
    on<DeleteHouseServiceProviderMyHouseEvent>(
        _deleteHouseServiceProviderMyHouseEvent,
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
    await deleteVehicleUsecase.call(
        event.idUnit, event.vehicle.plate, event.index);
    emit(DeleteVehicleCompleteMyHouseState());
  }

  Future<void> _registerVisitorMyHouseEvent(
      RegisterVisitorMyHouseEvent event, Emitter<MyHouseStates> emit) async {
    emit(RegisterVisitorLoadingMyHouseState());
    await registerVisitorUsecase.call(event.visitor);
    emit(RegisterVisitorCompleteMyHouseState());
  }

  Future<void> _registerHouseServiceProviderMyHouseEvent(
      RegisterHouseServiceProviderMyHouseEvent event,
      Emitter<MyHouseStates> emit) async {
    emit(RegisterHouseServiceProviderLoadingMyHouseState());
    await registerHouseServiceProviderUsecase.call(event.houseServiceProvider);
    emit(RegisterHouseServiceProviderCompleteMyHouseState());
  }

  Future<void> _updateValueVisitorEvent(
      UpdateValueVisitorEvent event, Emitter<MyHouseStates> emit) async {
    emit(UpdateVisitorLoadingMyHouseState());
    await updateValueVisitorUsecase.call(event.visitorEntity, event.index);
    emit(UpdateVisitorErrorMyHouseState());
  }

  Future<void> _deleteVisistorMyHouseEvent(
      DeleteVisistorMyHouseEvent event, Emitter<MyHouseStates> emit) async {
    emit(DeleteVisitorLoadingMyHouseState());
    await deleteVisitorUsecase.call(event.idUnit, event.cpf, event.index);
    emit(DeleteVisitorCompleteMyHouseState());
  }

  Future<void> _updateValueHouseServiceProviderEvent(
      UpdateValueHouseServiceProviderEvent event,
      Emitter<MyHouseStates> emit) async {
    emit(UpdateHouseServiceProviderLoadingMyHouseState());
    await updateValueHouseServiceProviderUsecase.call(
        event.houseServiceProviderEntity, event.index);
    emit(UpdateHouseServiceProviderCompleteMyHouseState());
  }

  Future<void> _deleteHouseServiceProviderMyHouseEvent(
      DeleteHouseServiceProviderMyHouseEvent event,
      Emitter<MyHouseStates> emit) async {
    emit(DeleteHouseServiceProviderLoadingMyHouseState());
    await deleteHouseServiceProviderUsecase.call(event.idUnit,event.cpf,event.index);
    emit(DeleteHouseServiceProviderCompleteMyHouseState());
  }
}
