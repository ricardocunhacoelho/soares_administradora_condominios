import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/Vehicles/list.vehicles.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/vehicles/register.new.vehicle.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class RegisteredVehicles extends StatefulWidget {
  const RegisteredVehicles({super.key});

  @override
  State<RegisteredVehicles> createState() => _RegisteredVehiclesState();
}

class _RegisteredVehiclesState extends State<RegisteredVehicles> {
  @override
  Widget build(BuildContext context) {
    final fetchUnitBloc = context.watch<FetchUnitBloc>();
    final fetchState = fetchUnitBloc.state;

    return Column(
      children: <Widget>[
        if (fetchState is CompleteFetchHomeUnitFetchStates)
          fetchState.homeUnitEntity.vehicles.isNotEmpty
              ? Column(
                  children: const [
                    //REGISTER
                    RegisterNewVehicle(),
                    SizedBox(height: 25),
                    //LIST Vehicles
                    SingleChildScrollView(child: ListVehicles()),
                  ],
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/registerVehicleForm');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kBlue,
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          boxShadow: [
                            BoxShadow(
                                color: kDarkBlue.withOpacity(0.051),
                                offset: const Offset(0.0, 3.0),
                                blurRadius: 24.0,
                                spreadRadius: 0.0)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/car-register.png'),
                                      fit: BoxFit.contain),
                                )),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                  'Você ainda não possui veículos cadastrados. Toque para cadastrar.',
                                  style: kPoppinsMedium.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3.5,
                                      color: kDarkBlue)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
      ],
    );
  }
}
