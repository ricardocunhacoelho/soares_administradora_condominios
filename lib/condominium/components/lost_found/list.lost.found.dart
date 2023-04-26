import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.lost.found.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/lost_found/item.lost.found.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

class ListLostFound extends StatefulWidget {
  const ListLostFound({super.key});

  @override
  State<ListLostFound> createState() => _ListLostFoundState();
}

class _ListLostFoundState extends State<ListLostFound> {
  @override
  Widget build(BuildContext context) {
    final fetchLostFoundBloc = context.watch<GetLostFoundBloc>();
    final fetchLostFoundState = fetchLostFoundBloc.state;

    return Column(
      children: [
        if (fetchLostFoundState is CompleteGetLostFoundState)
          ListView.builder(
              itemCount: fetchLostFoundState.lostFoundList.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                final lostFound = fetchLostFoundState.lostFoundList[index];
                return ItemLostFound(lostFound: lostFound);
              }),
        if (fetchLostFoundState is LoadingGetLostFoundState)
          const Center(child: CircularProgressIndicator()),
        if (fetchLostFoundState is ErrorGetLostFoundState)
          Center(
            child: Text('Erro ${fetchLostFoundState.message}'),
          )
      ],
    );
  }
}
