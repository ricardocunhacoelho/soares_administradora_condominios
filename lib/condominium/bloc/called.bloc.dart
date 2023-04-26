import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/domain/usecases/send.called.usecase.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

class CalledBloc extends Bloc<CalledEvents, CalledStates> {
  final ISendCalled sendCalledUsecase;

  CalledBloc(
    this.sendCalledUsecase,
  ) : super(InitialCalledState()) {
    on<SendCalledEvent>(_sendCalledEvent, transformer: sequential());
    on<InitCalledEvent>(_initCalledEvent, transformer: sequential());
  }

  Future<void> _sendCalledEvent(
      SendCalledEvent event, Emitter<CalledStates> emit) async {
    emit(LoadingSendCalledState());
    try {
      await sendCalledUsecase.call(event.called);
      emit(CompleteSendCalledState());
    } catch (e) {
      emit(ErrorSendCalledState(e.toString()));
    }
  }

  Future<void> _initCalledEvent(
      InitCalledEvent event, Emitter<CalledStates> emit) async {
    emit(InitialCalledState());
  }
}
