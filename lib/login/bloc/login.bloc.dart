import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/login/events/login.events.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final IAuthenticateHomeUnit authenticateHomeUnitUsecase;
  final IFetchHomeUnit fetchHomeUnitUsecase;

  LoginBloc(
    this.authenticateHomeUnitUsecase,
    this.fetchHomeUnitUsecase,
  ) : super(InitialLoginState()) {
    on<AuthenticateHomeUnitLoginEvent>(_authenticateHomeUnitLoginEvent,
        transformer: restartable());
    on<FetchHomeUnitLoginEvent>(_fetchHomeUnitLoginEvent,
        transformer: restartable());
  }

  Future<void> _authenticateHomeUnitLoginEvent(
      AuthenticateHomeUnitLoginEvent event, Emitter<LoginStates> emit) async {
    emit(AuthenticateHomeUnitLoadingLoginState());
    await authenticateHomeUnitUsecase.call(event.email, event.pass);
    emit(AuthenticateHomeUnitCompleteLoginState());
  }

  Future<void> _fetchHomeUnitLoginEvent(
      FetchHomeUnitLoginEvent event, Emitter<LoginStates> emit) async {
    emit(LoadingFetchHomeUnitLoginState());
    final homeUnit = await fetchHomeUnitUsecase.call(event.uid);
    emit(CompleteFetchHomeUnitLoginState(homeUnit));
  }
}
