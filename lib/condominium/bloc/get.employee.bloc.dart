import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/employee/domain/entity/employee.entity.dart';
import 'package:soares_administradora_condominios/adm/employee/domain/usecases/get.all.employee.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';




class GetEmployeeBloc extends Bloc<GetEmployeeEvents, GetEmployeeStates> {
  final IGetAllEmployee getAllEmployeeUsecase;

  GetEmployeeBloc(
    this.getAllEmployeeUsecase,
  ) : super(InitialEmployeeState()) {
    on<GetAllEmployeeEvent>(_getAllEmployeeEvent,
        transformer: sequential());
  }

  Future<void> _getAllEmployeeEvent(
      GetAllEmployeeEvent event, Emitter<GetEmployeeStates> emit) async {
    emit(LoadingGetEmployeeState());
    await emit.forEach<List<EmployeeEntity>>(
      getAllEmployeeUsecase.call(),
      onData: (employeeEntities) => CompleteGetEmployeeState(employeeEntities),
      onError: (error, st) => ErrorGetEmployeeState(error.toString()),
    );
  }
}
