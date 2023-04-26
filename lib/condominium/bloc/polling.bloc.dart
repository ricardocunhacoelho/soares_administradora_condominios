import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/usecases/answer.polling.usecase.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

class PollingBloc extends Bloc<PollingEvents, PollingStates> {
  final IAnswerPolling answerPollingUsecase;

  PollingBloc(
    this.answerPollingUsecase,
  ) : super(InitialPollingsState()) {
    on<AnswerPollingEvent>(_answerPollingEvent, transformer: sequential());
  }

  Future<void> _answerPollingEvent(
      AnswerPollingEvent event, Emitter<PollingStates> emit) async {
    emit(LoadingAnswerPollingState());
    try {
      print('chegou aqui');
      await answerPollingUsecase.call(
          event.uid, event.listPollingsUser, event.responsePolling, event.polling);
      emit(CompleteAnswerPollingState());
    } catch (e) {
      emit(ErrorAnswerPollingState(e.toString()));
    }
  }
}
