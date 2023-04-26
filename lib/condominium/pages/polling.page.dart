import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.polling.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/polling/list.pollings.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class PollingPage extends StatefulWidget {
  const PollingPage({super.key});

  @override
  State<PollingPage> createState() => _PollingPageState();
}

class _PollingPageState extends State<PollingPage> {
  @override
  Widget build(BuildContext context) {
    final fetchPollingBloc = context.watch<GetPollingBloc>();
    final fetchPollingState = fetchPollingBloc.state;
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
              child: Text('Enquetes',
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: kDarkBlue)),
            ),
            //LOADING
            if (fetchPollingState is LoadingGetPollingState || loginstate is LoadingFetchUserLoginState)
              const Center(
                child: CircularProgressIndicator(),
              ),
            //REGISTERED RESIDENTS
            if (fetchPollingState is CompleteGetPollingState &&
                loginstate is CompleteFetchUserResidentLoginState)
              ListPollings(listPollingsUser : loginstate.resident.answeredPolling, uid: loginstate.resident.id),
            //ERROR
            if (fetchPollingState is ErrorGetPollingState)
              Center(
                child: IconButton(
                    onPressed: () async {
                      //   context.read<FetchUnitBloc>().add(
                      //       FetchHomeUnitFetchEvents(
                      //           loginstate.resident.homeUnitEntity));
                    },
                    icon: const Icon(Icons.refresh)),
              ),
          ],
        ),
      ),
    );
  }
}
