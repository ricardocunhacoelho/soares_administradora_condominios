import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/qrcode/item.qr.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:soares_administradora_condominios/person/adapters/person.adapters.dart';
import 'package:soares_administradora_condominios/person/person.object.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

class ListQr extends StatefulWidget {
  final int current;
  const ListQr({super.key, required this.current});

  @override
  State<ListQr> createState() => _ListQrState();
}

class _ListQrState extends State<ListQr> {
  List allPerson = [];
  List moradores = [];
  List visitantes = [];
  List funcionarios = [];
  @override
  Widget build(BuildContext context) {
    final myHouseBloc = context.watch<FetchUnitBloc>();
    final myHouseState = myHouseBloc.state;
    if (myHouseState is CompleteFetchHomeUnitFetchStates) {
      if (widget.current == 0) {
        allPerson = [
          ...ToFromPersonObject.ResidentToPerson(
              myHouseState.homeUnitEntity.residents),
          ...ToFromPersonObject.VisitorsToPerson(
              myHouseState.homeUnitEntity.visitors),
          ...ToFromPersonObject.HouseServiceProviderToPerson(
              myHouseState.homeUnitEntity.houseServiceProviders)
        ];
      }
      if (widget.current == 1) {
        allPerson = [
          ...ToFromPersonObject.ResidentToPerson(
              myHouseState.homeUnitEntity.residents),
        ];
      }
      if (widget.current == 2) {
        allPerson = [
          ...ToFromPersonObject.VisitorsToPerson(
              myHouseState.homeUnitEntity.visitors),
        ];
      }
      if (widget.current == 3) {
        allPerson = [
          ...ToFromPersonObject.HouseServiceProviderToPerson(
              myHouseState.homeUnitEntity.houseServiceProviders)
        ];
      }
    }

    return Column(
      children: [
        if (myHouseState is CompleteFetchHomeUnitFetchStates)
          ListView.builder(
              itemCount: allPerson.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                final person = allPerson[index];
                return ItemQr(
                  person: person,
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
