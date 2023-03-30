import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/home_unit/domain/usecases/fetch.home.unit.usecase.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:soares_administradora_condominios/resident/domain/usecases/delete.resident.usecase.dart';
import 'package:soares_administradora_condominios/resident/domain/usecases/register.resident.usecase.dart';
import 'package:soares_administradora_condominios/resident/domain/usecases/update.value.resident.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/add.profile.image.user.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/delete.profile.image.user.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/update.value.user.usecase.dart';

class MyHouseBloc extends Bloc<MyHouseEvents, MyHouseStates> {
  final IAddProfileImageUser addProfileImageUserUsecase;
  final IUpdateValueUser updateValueUserUsecase;
  final IDeleteProfileImageUser deleteProfileImageUserUsecase;
  final IRegisterResident registerResidentUsecase;
  final IUpdateValueResident updateValueResidentUsecase;
  final IDeleteResident deleteResidentUsecase;
  final IFetchHomeUnit fetchHomeUnitUsecase;
  MyHouseBloc(
    this.addProfileImageUserUsecase,
    this.updateValueUserUsecase,
    this.deleteProfileImageUserUsecase,
    this.registerResidentUsecase,
    this.updateValueResidentUsecase,
    this.deleteResidentUsecase,
    this.fetchHomeUnitUsecase,
  ) : super(InitialMyHouseState()) {
    on<UpdateValueUserMyHouseEvent>(_updateValueUserMyHouseEvent,
        transformer: sequential());
    on<RegisterResidentMyHouseEvent>(_registerResidentMyHouseEvent,
        transformer: sequential());
    on<UpdateValueResidentMyHouseEvent>(_updateValueResidentMyHouseEvent,
        transformer: sequential());
    on<DeleteResidentMyHouseEvent>(_deleteResidentMyHouseEvent,
        transformer: sequential());
    on<FetchHomeUnitMyHouseEvent>(_fetchHomeUnitMyHouseEvent,
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
    await deleteResidentUsecase.call(event.cpf, event.index);
    emit(DeleteResidentCompleteMyHouseState());
  }

  Future<void> _fetchHomeUnitMyHouseEvent(
      FetchHomeUnitMyHouseEvent event, Emitter<MyHouseStates> emit) async {
    emit(LoadingFetchHomeUnitMyHouseState());
    await emit.forEach<dynamic>(
      fetchHomeUnitUsecase.call(event.id),
      onData: (homeUnit) => CompleteFetchHomeUnitMyHouseState(homeUnit),
      onError: (error, st) => ErrorFetchHomeUnitMyHouseState(error.toString()),
    );
  }
}
