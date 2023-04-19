import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/entity/task.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/usecases/get.all.task.condominium.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';



class GetTaskCondominiumBloc extends Bloc<GetAllTaskCondominiumEvent, GetTaskCondominiumStates> {
  final IGetAllTaskCondominium getAllTaskCondominiumUsecase;

  GetTaskCondominiumBloc(
    this.getAllTaskCondominiumUsecase,
  ) : super(InitialTaskCondominiumState()) {
    on<GetAllTaskCondominiumEvent>(_getAllTaskCondominiumEvent,
        transformer: sequential());
  }

  Future<void> _getAllTaskCondominiumEvent(
      GetAllTaskCondominiumEvent event, Emitter<GetTaskCondominiumStates> emit) async {
    emit(LoadingGetTaskCondominiumState());
    await emit.forEach<List<TaskCondominiumEntity>>(
      getAllTaskCondominiumUsecase.call(),
      onData: (taskCondominiumEntitys) => CompleteGetTaskCondominiumState(taskCondominiumEntitys),
      onError: (error, st) => ErrorGetTaskCondominiumState(error.toString()),
    );
  }
}
