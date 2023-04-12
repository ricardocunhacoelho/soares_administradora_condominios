import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/house_service_provider/item.house.service.provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/residents/item.resident.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';

class ListHouseServiceProvider extends StatefulWidget {
  const ListHouseServiceProvider({super.key});

  @override
  State<ListHouseServiceProvider> createState() => _ListHouseServiceProviderState();
}

class _ListHouseServiceProviderState extends State<ListHouseServiceProvider> {
  @override
  Widget build(BuildContext context) {
    final myHouseBloc = context.watch<FetchUnitBloc>();
    final myHouseState = myHouseBloc.state;

    return Column(
      children: [
        if (myHouseState is CompleteFetchHomeUnitFetchStates)
          ListView.builder(
              itemCount: myHouseState.homeUnitEntity.houseServiceProviders.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                final houseServiceProvider = myHouseState.homeUnitEntity.houseServiceProviders[index];
                return ItemHouseServiceProvider(
                  houseServiceProviderEntity: houseServiceProvider,
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
