import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.area.condominium.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/item.area.condominium.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

class ListAreaCondominium extends StatefulWidget {
  const ListAreaCondominium({super.key});

  @override
  State<ListAreaCondominium> createState() => _ListAreaCondominiumState();
}

class _ListAreaCondominiumState extends State<ListAreaCondominium> {
  @override
  Widget build(BuildContext context) {
    final fetchAreaCondominiumBloc = context.watch<GetAreaCondominiumBloc>();
    final fetchAreaCondominiumState = fetchAreaCondominiumBloc.state;

    return Column(
      children: [
        if (fetchAreaCondominiumState is CompleteGetAreaCondominiumState)
          ListView.builder(
              itemCount: fetchAreaCondominiumState.areaCondominiumList.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                final areaCondominium = fetchAreaCondominiumState.areaCondominiumList[index];
                return ItemAreaCondominium(areaCondominium: areaCondominium);
              }),
        if (fetchAreaCondominiumState is LoadingGetAreaCondominiumState)
          const Center(child: CircularProgressIndicator()),
        if (fetchAreaCondominiumState is ErrorGetAreaCondominiumState)
          Center(
            child: Text('Erro ${fetchAreaCondominiumState.message}'),
          )
      ],
    );
  }
}
