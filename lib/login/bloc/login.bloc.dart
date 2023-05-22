import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/login/events/login.events.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/authenticate.user.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/fetch.user.usecase.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final IAuthenticateUser authenticateUserUsecase;
  final IFetchUser fetchUserUsecase;

  LoginBloc(
    this.authenticateUserUsecase,
    this.fetchUserUsecase,
  ) : super(InitialLoginState()) {
    on<AuthenticateUserLoginEvent>(_authenticateUserLoginEvent,
        transformer: sequential());
    on<ChangeProfileImageEvent>(_changeProfileImageEvent,
        transformer: sequential());
  }

  Future<void> _authenticateUserLoginEvent(
      AuthenticateUserLoginEvent event, Emitter<LoginStates> emit) async {
    emit(AuthenticateUserLoadingLoginState());
    final result = await authenticateUserUsecase.call(event.email, event.pass);
    if (result.isSuccess) {
      emit(AuthenticateUserCompleteLoginState());
      print('Sucess Login');
    } else {
      emit(AuthenticateUserErrorLoginState(result.msgError!));
    }
  }

  _changeProfileImageEvent(
      ChangeProfileImageEvent event, Emitter<LoginStates> emit) {
        emit(ChangeProfileImageState());
        emit(ChangeProfileImageCompleteState());
      }
}
