import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/vehicles/item.vehicle.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';

class ListVehicles extends StatefulWidget {
  const ListVehicles({super.key});

  @override
  State<ListVehicles> createState() => _ListVehiclesState();
}

class _ListVehiclesState extends State<ListVehicles> {
  @override
  Widget build(BuildContext context) {
    final myHouseBloc = context.watch<FetchUnitBloc>();
    final myHouseState = myHouseBloc.state;

    return Column(
      children: [
        if (myHouseState is CompleteFetchHomeUnitFetchStates)
          ListView.builder(
              itemCount: myHouseState.homeUnitEntity.vehicles.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                final vehicle = myHouseState.homeUnitEntity.vehicles[index];
                return ItemVehicle(
                  vehicleEntity: vehicle,
                  index: index,
                );
              }),
        if (myHouseState is LoadingFetchHomeUnitFetchStates ||
            myHouseState is InitialMyHouseState)
          const Center(child: CircularProgressIndicator()),
        if (myHouseState is ErrorFetchHomeUnitFetchStates)
          Center(
            child: Text('Erro ${myHouseState.message}'),
          )
      ],
    );
  }
}
