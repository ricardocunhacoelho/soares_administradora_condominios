import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.area.condominium.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/item.area.condominium.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/reserves/item.reserve.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';
import 'package:soares_administradora_condominios/login/bloc/fetch.user.login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';

class ListReserves extends StatefulWidget {
  const ListReserves({super.key});

  @override
  State<ListReserves> createState() => _ListReservesState();
}

class _ListReservesState extends State<ListReserves> {
  @override
  Widget build(BuildContext context) {
    final fetchUserBloc = context.watch<FetchUserBloc>();
    final fetchUserState = fetchUserBloc.state;

    return Column(
      children: [
        if (fetchUserState is CompleteFetchUserResidentLoginState)
          ListView.builder(
              itemCount: fetchUserState.resident.reserves.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                final reserve = fetchUserState.resident.reserves[index];
                return ItemReserve(reserve: reserve);
              }),
        if (fetchUserState is LoadingFetchUserLoginState)
          const Center(child: CircularProgressIndicator()),
        if (fetchUserState is ErrorFetchUserLoginState)
          Center(
            child: Text('Erro ${fetchUserState.message}'),
          )
      ],
    );
  }
}
