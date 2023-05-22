import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/components/circular.information.button.condominium.dart';
import 'package:soares_administradora_condominios/condominium/components/communication.condominium.dart';
import 'package:soares_administradora_condominios/condominium/components/frame.condominium.dart';
import 'package:soares_administradora_condominios/condominium/components/header.condominium.dart';
import 'package:soares_administradora_condominios/login/bloc/fetch.user.login.bloc.dart';
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
    final fetchUserBloc = context.watch<FetchUserBloc>();
    final fetchUserState = fetchUserBloc.state;

    return SafeArea(
      child: fetchUserState is CompleteFetchUserResidentLoginState
          ? ListView(
              padding: const EdgeInsets.only(bottom: 40),
              children: [
                //HEADER CONDOMINIUM
                const HeaderCondominium(),
                const SizedBox(height: 20),
                //FRAME
                frameCondominiumAdm(fetchUserState.resident),
                const SizedBox(height: 15),
                //CIRCULAR BUTTONS
                circularInformationButtonCondominium(context),
                const SizedBox(height: 20),
                //COMMUNICATION
                const CommunicationCondominium(),
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
