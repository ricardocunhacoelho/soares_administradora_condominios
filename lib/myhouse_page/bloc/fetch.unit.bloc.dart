import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/home_unit/domain/usecases/fetch.home.unit.usecase.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';


class FetchUnitBloc extends Bloc<FetchEvents, FetchStates> {
  final IFetchHomeUnit fetchHomeUnitUsecase;

  FetchUnitBloc(
    this.fetchHomeUnitUsecase,
  ) : super(InitialFetchStates()) {
    on<FetchHomeUnitFetchEvents>(_fetchHomeUnitFetchEvents,
        transformer: sequential());
  }

  Future<void> _fetchHomeUnitFetchEvents(
      FetchHomeUnitFetchEvents event, Emitter<FetchStates> emit) async {
    emit(LoadingFetchHomeUnitFetchStates());
    await emit.forEach<dynamic>(
      fetchHomeUnitUsecase.call(event.id),
      onData: (homeUnit) => CompleteFetchHomeUnitFetchStates(homeUnit),
      onError: (error, st) => ErrorFetchHomeUnitFetchStates(error.toString()),
    );
  }
}
