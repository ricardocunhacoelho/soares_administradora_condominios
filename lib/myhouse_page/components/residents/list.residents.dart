import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/residents/item.resident.dart';

class ListResidents extends StatefulWidget {
  const ListResidents({super.key});

  @override
  State<ListResidents> createState() => _ListResidentsState();
}

class _ListResidentsState extends State<ListResidents> {
  @override
  Widget build(BuildContext context) {
    final loginbloc = context.watch<LoginBloc>();
    final loginstate = loginbloc.state;

    return Column(
      children: [
        if (loginstate is CompleteFetchUserHomeUnitLoginState)
          ListView.builder(
              itemCount: loginstate.homeUnitEntity.residents.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                final resident = loginstate.homeUnitEntity.residents[index];
                return ItemResident(
                  residentEntity: resident,
                  index: index,
                );
              }),
        if (loginstate is LoadingFetchUserLoginState ||
            loginstate is InitialLoginState)
          const Center(child: CircularProgressIndicator()),
        if (loginstate is ErrorFetchUserLoginState)
          Center(
            child: Text('Erro ${loginstate.message}'),
          )
      ],
    );
  }
}
