import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/home_unit/domain/usecases/fetch.home.unit.usecase.dart';
import 'package:soares_administradora_condominios/login/events/login.events.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/authenticate.user.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/fetch.user.usecase.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final IAuthenticateUser authenticateUserUsecase;
  final IFetchUser fetchUserUsecase;

  LoginBloc(
    this.authenticateUserUsecase,
    this.fetchUserUsecase,
  ) : super(InitialLoginState()) {
    on<AuthenticateUserLoginEvent>(_authenticateUserLoginEvent,
        transformer: restartable());
    on<FetchUserLoginEvent>(_fetchUserLoginEvent, transformer: restartable());
    
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

  Future<void> _fetchUserLoginEvent(
      FetchUserLoginEvent event, Emitter<LoginStates> emit) async {
    emit(LoadingFetchUserLoginState());
    await emit.forEach<dynamic>(
      fetchUserUsecase.call(event.uid),
      onData: (user) {  
        return user.userType == EUserType.resident
            ? CompleteFetchUserResidentLoginState(user as ResidentEntity)
            : CompleteFetchUserWorkerLoginState(user as WorkerEntity);
      },
      onError: (error, st) => ErrorFetchUserLoginState(error.toString()),
    );
  }

}
