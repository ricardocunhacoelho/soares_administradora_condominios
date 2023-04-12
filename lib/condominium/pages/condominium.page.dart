import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/components/header.condominium.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';

import '../../app.style.dart';


class Condominium extends StatefulWidget {
  const Condominium({super.key});

  @override
  State<Condominium> createState() => _CondominiumState();
}

class _CondominiumState extends State<Condominium> {
  @override
  Widget build(BuildContext context) {
    final loginbloc = context.watch<LoginBloc>();
    final loginstate = loginbloc.state;
    final myHouseBloc = context.watch<MyHouseBloc>();
    final myHouseState = myHouseBloc.state;

    return SafeArea(
      child: loginstate is CompleteFetchUserResidentLoginState
          ? ListView(
              padding: const EdgeInsets.only(bottom: 40),
              children: const [
                //HEADER CONDOMINIUM
                HeaderCondominium(),
                SizedBox(height: 20),
                //FRAME
              ],
            )
          : const SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
