import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/usecases/get.all.area.condominium.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';


class GetAreaCondominiumBloc
    extends Bloc<GetAreaCondominiumEvents, GetAreaCondominiumStates> {
  final IGetAllAreaCondominium getAllAreaCondominiumUsecase;

  GetAreaCondominiumBloc(
    this.getAllAreaCondominiumUsecase,
  ) : super(InitialGetAreaCondominiumStates()) {
    on<GetAllAreaCondominiumEvent>(_getAllAreaCondominiumEvent, transformer: restartable());
  }
  Future<void> _getAllAreaCondominiumEvent(
      GetAllAreaCondominiumEvent event, Emitter<GetAreaCondominiumStates> emit) async {
    emit(LoadingGetAreaCondominiumState());
    await emit.forEach<List<AreaCondominiumEntity>>(
      getAllAreaCondominiumUsecase.call(),
      onData: (areaCondominiumEntities) => CompleteGetAreaCondominiumState(areaCondominiumEntities),
      onError: (error, st) => ErrorGetAreaCondominiumState(error.toString()),
    );
  }
}
