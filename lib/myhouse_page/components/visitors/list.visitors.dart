import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/residents/item.resident.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/visitors/item.visitor.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';

class ListVisitors extends StatefulWidget {
  const ListVisitors({super.key});

  @override
  State<ListVisitors> createState() => _ListVisitorsState();
}

class _ListVisitorsState extends State<ListVisitors> {
  @override
  Widget build(BuildContext context) {
    final myHouseBloc = context.watch<FetchUnitBloc>();
    final myHouseState = myHouseBloc.state;

    return Column(
      children: [
        if (myHouseState is CompleteFetchHomeUnitFetchStates)
          ListView.builder(
              itemCount: myHouseState.homeUnitEntity.visitors.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                final visitor = myHouseState.homeUnitEntity.visitors[index];
                return ItemVisitor(
                  visitorEntity: visitor,
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
