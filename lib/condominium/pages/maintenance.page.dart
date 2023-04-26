import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/components/called_condominium/form.send.message.dart';
import 'package:soares_administradora_condominios/condominium/components/maintenance/form.request.maintenance.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({super.key});

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  @override
  Widget build(BuildContext context) {
    final loginbloc = context.watch<LoginBloc>();
    final loginstate = loginbloc.state;

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
              child: Text('Solicitar manutenção',
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: kDarkBlue)),
            ),
            //LOADING
            if (loginstate is LoadingFetchUserLoginState)
              const Center(
                child: CircularProgressIndicator(),
              ),
            //REQUEST MAINTENANCE
            if (loginstate is CompleteFetchUserResidentLoginState)
              FormRequestMaintenance(
                  residentID: loginstate.resident.id,
                  unitId: loginstate.resident.unit.id),
            //ERROR
            if (loginstate is ErrorFetchUserLoginState)
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
