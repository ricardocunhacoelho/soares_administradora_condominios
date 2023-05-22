import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/usecases/fetch.area.usecase.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

class FetchAreaBloc
    extends Bloc<FetchAreaCondominiumEvents, FetchAreaCondominiumStates> {
  final IFetchArea fetchAreaUsecase;

  FetchAreaBloc(
    this.fetchAreaUsecase,
  ) : super(InitialFetchAreaCondominiumState()) {
    on<FetchAreaCondominiumEvent>(_fetchAreaCondominiumEvent,
        transformer: sequential());
  }

  Future<void> _fetchAreaCondominiumEvent(FetchAreaCondominiumEvent event,
      Emitter<FetchAreaCondominiumStates> emit) async {
    emit(LoadingFetchAreaCondominiumState());
    await emit.forEach<dynamic>(
      fetchAreaUsecase.call(event.id),
      onData: (area) => CompleteFetchAreaCondominiumState(area),
      onError: (error, st) => ErrorFetchAreaCondominiumState(error.toString()),
    );
  }
}
