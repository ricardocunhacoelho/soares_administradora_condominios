import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.employee.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/employee/item.employee.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

class ListEmployee extends StatefulWidget {
  const ListEmployee({super.key});

  @override
  State<ListEmployee> createState() => _ListEmployeeState();
}

class _ListEmployeeState extends State<ListEmployee> {
  @override
  Widget build(BuildContext context) {
    final fetchEmployeeBloc = context.watch<GetEmployeeBloc>();
    final fetchEmployeeState = fetchEmployeeBloc.state;

    return Column(
      children: [
        if (fetchEmployeeState is CompleteGetEmployeeState)
          ListView.builder(
              itemCount: fetchEmployeeState.employeeList.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                final employee = fetchEmployeeState.employeeList[index];
                return ItemEmployee(employee: employee);
              }),
        if (fetchEmployeeState is LoadingGetEmployeeState)
          const Center(child: CircularProgressIndicator()),
        if (fetchEmployeeState is ErrorGetEmployeeState)
          Center(
            child: Text('Erro ${fetchEmployeeState.message}'),
          )
      ],
    );
  }
}
