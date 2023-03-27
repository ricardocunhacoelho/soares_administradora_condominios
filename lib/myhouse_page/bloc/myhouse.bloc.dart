import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:soares_administradora_condominios/resident/domain/usecases/register.resident.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/add.profile.image.user.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/delete.profile.image.user.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/update.value.user.usecase.dart';

class MyHouseBloc extends Bloc<MyHouseEvents, MyHouseStates> {
  final IAddProfileImageUser addProfileImageUserUsecase;
  final IUpdateValueUser updateValueUserUsecase;
  final IDeleteProfileImageUser deleteProfileImageUserUsecase;
  final IRegisterResident registerResidentUsecase;
  MyHouseBloc(
    this.addProfileImageUserUsecase,
    this.updateValueUserUsecase,
    this.deleteProfileImageUserUsecase,
    this.registerResidentUsecase,
  ) : super(InitialMyHouseState()) {
    on<UpdateValueUserUsecaseMyHouseEvent>(_updateValueUserUsecaseMyHouseEvent,
        transformer: sequential());
    on<RegisterResidentMyHouseEvent>(_registerResidentMyHouseEvent,
        transformer: sequential());
  }

  Future<void> _updateValueUserUsecaseMyHouseEvent(
      UpdateValueUserUsecaseMyHouseEvent event,
      Emitter<MyHouseStates> emit) async {
    emit(UpdateValueUserLoadingMyHouseState());
    await updateValueUserUsecase.call(event.library, event.data);
    emit(UpdateValueUserCompleteMyHouseState());
  }
    Future<void> _registerResidentMyHouseEvent(
      RegisterResidentMyHouseEvent event,
      Emitter<MyHouseStates> emit) async {
    emit(RegisterResidentLoadingMyHouseState());
    await registerResidentUsecase.call(event.resident);
    emit(RegisterResidentCompleteMyHouseState());
  }
}
