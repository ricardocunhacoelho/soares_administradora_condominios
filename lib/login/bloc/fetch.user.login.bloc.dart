import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/login/events/login.events.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/fetch.user.usecase.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';


class FetchUserBloc extends Bloc<LoginEvents, FetchUserStates> {
  final IFetchUser fetchUserUsecase;

  FetchUserBloc(
    this.fetchUserUsecase,
  ) : super(InitialFetchUserState()) {
    on<FetchUserLoginEvent>(_fetchUserLoginEvent,
        transformer: sequential());
  }

  Future<void> _fetchUserLoginEvent(
      FetchUserLoginEvent event, Emitter<FetchUserStates> emit) async {
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
