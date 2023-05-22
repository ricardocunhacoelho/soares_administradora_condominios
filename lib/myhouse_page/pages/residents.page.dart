import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/fetch.user.login.bloc.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/events/login.events.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/residents/registered.residents.component.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class ResidentsPage extends StatefulWidget {
  const ResidentsPage({super.key});

  @override
  State<ResidentsPage> createState() => _ResidentsPageState();
}

class _ResidentsPageState extends State<ResidentsPage> {
  @override
  Widget build(BuildContext context) {
    final fetchBloc = context.watch<FetchUnitBloc>();
    final fetchState = fetchBloc.state;
    final fetchUserBloc = context.watch<FetchUserBloc>();
    final fetchUserState = fetchUserBloc.state;

    if (fetchUserState is CompleteFetchUserResidentLoginState) {
      context
          .read<FetchUnitBloc>()
          .add(FetchHomeUnitFetchEvents(fetchUserState.resident.homeUnitEntity));
    }
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.navigate_before,
                color: kDarkGrey,
                size: SizeConfig.blockSizeHorizontal! * 7.5,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        backgroundColor: kLightWhite,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.help_center,
              color: kDarkGrey,
              size: SizeConfig.blockSizeHorizontal! * 7.5,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: kLightWhite,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            //TITULO
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('Moradores',
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: kDarkBlue)),
            ),
            //LOADING
            if (fetchState is LoadingFetchHomeUnitFetchStates)
              const Center(
                child: CircularProgressIndicator(),
              ),
            //REGISTERED RESIDENTS
            if (fetchState is CompleteFetchHomeUnitFetchStates)
              const RegisteredResidents(),
            //ERROR
            if (fetchState is ErrorFetchHomeUnitFetchStates ||
                fetchUserState is ErrorFetchUserLoginState)
              Center(
                child: IconButton(
                    onPressed: () async {
                      final uid =
                          FirebaseAuth.instance.currentUser!.uid.toString();
                      context.read<LoginBloc>().add(FetchUserLoginEvent(uid));
                      if (fetchUserState is CompleteFetchUserResidentLoginState) {
                        context.read<FetchUnitBloc>().add(
                            FetchHomeUnitFetchEvents(
                                fetchUserState.resident.homeUnitEntity));
                      }
                    },
                    icon: const Icon(Icons.refresh)),
              ),
          ],
        ),
      ),
    );
  }
}
