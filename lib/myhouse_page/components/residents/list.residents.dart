import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/residents/item.resident.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';

class ListResidents extends StatefulWidget {
  const ListResidents({super.key});

  @override
  State<ListResidents> createState() => _ListResidentsState();
}

class _ListResidentsState extends State<ListResidents> {
  @override
  Widget build(BuildContext context) {
    final myHouseBloc = context.watch<MyHouseBloc>();
    final myHouseState = myHouseBloc.state;

    return Column(
      children: [
        if (myHouseState is CompleteFetchHomeUnitMyHouseState)
          ListView.builder(
              itemCount: myHouseState.homeUnitEntity.residents.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                final resident = myHouseState.homeUnitEntity.residents[index];
                return ItemResident(
                  residentEntity: resident,
                  index: index,
                );
              }),
        if (myHouseState is LoadingFetchHomeUnitMyHouseState ||
            myHouseState is InitialMyHouseState)
          const Center(child: CircularProgressIndicator()),
        if (myHouseState is ErrorFetchHomeUnitMyHouseState)
          Center(
            child: Text('Erro ${myHouseState.message}'),
          )
      ],
    );
  }
}
