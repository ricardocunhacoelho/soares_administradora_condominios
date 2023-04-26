import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/lost_found/domain/entity/lost.found.entity.dart';
import 'package:soares_administradora_condominios/adm/lost_found/domain/usecases/get.all.lost.found.condominium.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';



class GetLostFoundBloc extends Bloc<GetLostFoundEvents, GetLostFoundStates> {
  final IGetAllLostFound getAllLostFoundUsecase;

  GetLostFoundBloc(
    this.getAllLostFoundUsecase,
  ) : super(InitialLostFoundState()) {
    on<GetAllLostFoundEvent>(_getAllLostFoundEvent,
        transformer: sequential());
  }

  Future<void> _getAllLostFoundEvent(
      GetAllLostFoundEvent event, Emitter<GetLostFoundStates> emit) async {
    emit(LoadingGetLostFoundState());
    await emit.forEach<List<LostFoundEntity>>(
      getAllLostFoundUsecase.call(),
      onData: (lostFoundEntities) => CompleteGetLostFoundState(lostFoundEntities),
      onError: (error, st) => ErrorGetLostFoundState(error.toString()),
    );
  }
}
