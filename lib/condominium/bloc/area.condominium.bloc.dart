import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/usecases/make.reserve.usecase.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

class AreaCondominiumBloc extends Bloc<AreaCondominiumEvents, AreaCondominiumStates> {
  final IMakeReserve makeReserveUsecase;

  AreaCondominiumBloc(
    this.makeReserveUsecase,
  ) : super(InitialAreaCondominiumState()) {
    on<MakeReserveAreaCondominiumEvent>(_makeReserveAreaCondominiumEvent, transformer: sequential());
    on<InitialAreaCondominiumEvent>(_initialAreaCondominiumEvent, transformer: sequential());
  }

  Future<void> _makeReserveAreaCondominiumEvent(
      MakeReserveAreaCondominiumEvent event, Emitter<AreaCondominiumStates> emit) async {
    emit(LoadingMakeReserveAreaCondominiumState());
    try {
      await makeReserveUsecase.call(event.reserve,event.uid);
      emit(CompleteMakeReserveAreaCondominiumState());
    } catch (e) {
      emit(ErrorMakeReserveAreaCondominiumState(e.toString()));
    }
  }

  void _initialAreaCondominiumEvent(
      InitialAreaCondominiumEvent event, Emitter<AreaCondominiumStates> emit) {
    emit(InitialAreaCondominiumState());
  }
}
