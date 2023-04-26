import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.employee.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/employee/list.employee.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {
    final fetchEmployeeBloc = context.watch<GetEmployeeBloc>();
    final fetchEmployeeState = fetchEmployeeBloc.state;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.navigate_before,
                color: kDarkGrey,
                size: SizeConfig.blockSizeHorizontal! * 7.5,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        backgroundColor: kLightWhite,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.help_center,
              color: kDarkGrey,
              size: SizeConfig.blockSizeHorizontal! * 7.5,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: kLightWhite,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            //TITULO
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('Funcionários do Condomínio',
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: kDarkBlue)),
            ),
            //LOADING
            if (fetchEmployeeState is LoadingGetEmployeeState)
              const Center(
                child: CircularProgressIndicator(),
              ),
            //GET LIST LOST FOUND COMPLETE
            if (fetchEmployeeState is CompleteGetEmployeeState)
              const ListEmployee(),
            //ERROR
            if (fetchEmployeeState is ErrorGetEmployeeState)
              Center(
                child: IconButton(
                    onPressed: () async {
                      //   context.read<FetchUnitBloc>().add(
                      //       FetchHomeUnitFetchEvents(
                      //           loginstate.resident.homeUnitEntity));
                    },
                    icon: const Icon(Icons.refresh)),
              ),
          ],
        ),
      ),
    );
  }
}
