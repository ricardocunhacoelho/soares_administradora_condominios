import 'package:flutter/material.dart';

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
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 40),
        children: const [
          //HEADER MY HOUSE
          HeaderMyHouse(),
          SizedBox(height: 25),
          //MY FAMILY CIRCULAR ICONS
          MyFamilyCircularIcons(),
          SizedBox(height: 30),
          //HOME SERVICES PROVIDERS
          HomeServiceProviders(),
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
