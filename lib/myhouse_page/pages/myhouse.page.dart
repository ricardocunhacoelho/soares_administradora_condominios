import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/qrcode.resident.component.dart';

import '../../app.style.dart';

import 'package:soares_administradora_condominios/myhouse_page/components/header.myhouse.component.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/myfamily.circularicons.component.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/home.service.providers.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/more.usual.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/individual.announcements.dart';

class MyHouse extends StatefulWidget {
  const MyHouse({super.key});

  @override
  State<MyHouse> createState() => _MyHouseState();
}

class _MyHouseState extends State<MyHouse> {
  @override
  Widget build(BuildContext context) {
    final loginbloc = context.watch<LoginBloc>();
    final loginstate = loginbloc.state;
    final myHouseBloc = context.watch<MyHouseBloc>();
    final myHouseState = myHouseBloc.state;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 40),
        children: [
          //HEADER MY HOUSE
          HeaderMyHouse(),
          SizedBox(height: 20),
          //QRCODE RESIDENT
          if (loginstate is CompleteFetchUserResidentLoginState)
            QrCodeResident(
              uid: loginstate.resident.id,
              name: loginstate.resident.name,
            ),
          const SizedBox(height: 20),
          //MY HOUSE CIRCULAR ICONS
          if (loginstate is CompleteFetchUserResidentLoginState)
            myFamilyCircularIcons(context, loginstate.resident, myHouseState),
          SizedBox(height: 30),
          //HOME SERVICES PROVIDERS
          if (loginstate is CompleteFetchUserResidentLoginState)
            HomeServiceProviders(resident: loginstate.resident),
          SizedBox(height: 25),
          //divisor
          Divider(color: kLightGrey, thickness: 1),
          SizedBox(height: 15),
          //MORE USUAL
          MoreUsual(),
          SizedBox(height: 25),
          //divisor
          Divider(color: kLightGrey, thickness: 1),
          SizedBox(height: 15),
          //INDIVIDUAL ANNOUNCEMENTS AND NOTIFICATIONS
          IndividualAnnouncements(),
        ],
      ),
    );
  }
}
