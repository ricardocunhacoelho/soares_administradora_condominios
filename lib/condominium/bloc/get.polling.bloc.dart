import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/entity/polling.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/usecases/get.all.polling.usecase.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

class GetPollingBloc
    extends Bloc<GetPollingEvents, GetPollingStates> {
  final IGetAllPolling getAllPollingUsecase;

  GetPollingBloc(
    this.getAllPollingUsecase,
  ) : super(InitialPollingState()) {
    on<GetAllPollingEvent>(_getAllPollingEvent, transformer: restartable());
  }
  Future<void> _getAllPollingEvent(
      GetAllPollingEvent event, Emitter<GetPollingStates> emit) async {
    emit(LoadingGetPollingState());
    await emit.forEach<List<PollingEntity>>(
      getAllPollingUsecase.call(),
      onData: (filas) => CompleteGetPollingState(filas),
      onError: (error, st) => ErrorGetPollingState(error.toString()),
    );
  }
}
