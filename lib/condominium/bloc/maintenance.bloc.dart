import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/maintenance/domain/usecases/request.maintenance.usecase.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

class MaintenanceBloc extends Bloc<MaintenanceEvents, MaintenanceStates> {
  final IRequestMaintenance requestMaintenanceUsecase;

  MaintenanceBloc(
    this.requestMaintenanceUsecase,
  ) : super(InitialMaintenanceState()) {
    on<RequestMaintenanceEvent>(_requestMaintenanceEvent, transformer: sequential());
  }

  Future<void> _requestMaintenanceEvent(
      RequestMaintenanceEvent event, Emitter<MaintenanceStates> emit) async {
    emit(LoadingRequestMaintenanceState());
    try {
      await requestMaintenanceUsecase.call(event.maintenance);
      emit(CompleteRequestMaintenanceState());
    } catch (e) {
      emit(ErrorRequestMaintenanceState(e.toString()));
    }
  }
}
