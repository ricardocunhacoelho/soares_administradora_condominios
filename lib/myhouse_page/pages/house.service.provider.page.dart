import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/events/login.events.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/house_service_provider/registered.house.service.provider.component.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class HouseServiceProviderPage extends StatefulWidget {
  const HouseServiceProviderPage({super.key});

  @override
  State<HouseServiceProviderPage> createState() => _HouseServiceProviderPageState();
}

class _HouseServiceProviderPageState extends State<HouseServiceProviderPage> {
  @override
  Widget build(BuildContext context) {
    final fetchBloc = context.watch<FetchUnitBloc>();
    final fetchState = fetchBloc.state;
    final loginbloc = context.watch<LoginBloc>();
    final loginstate = loginbloc.state;

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
              child: Text('Funcionários Residência',
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: kDarkBlue)),
            ),
            //LOADING
            if (fetchState is LoadingFetchHomeUnitFetchStates)
              const Center(
                child: CircularProgressIndicator(),
              ),
            //REGISTERED VISITORS
            if (fetchState is CompleteFetchHomeUnitFetchStates)
              const RegisteredHouseServiceProvider(),
            //ERROR
            if (fetchState is ErrorFetchHomeUnitFetchStates ||
                loginstate is ErrorFetchUserLoginState)
              Center(
                child: IconButton(
                    onPressed: () async {
                      final uid =
                          FirebaseAuth.instance.currentUser!.uid.toString();
                      context.read<LoginBloc>().add(FetchUserLoginEvent(uid));
                      if (loginstate is CompleteFetchUserResidentLoginState) {
                        context.read<FetchUnitBloc>().add(
                            FetchHomeUnitFetchEvents(
                                loginstate.resident.homeUnitEntity));
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
