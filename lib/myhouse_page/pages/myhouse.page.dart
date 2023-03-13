import 'package:flutter/material.dart';

import 'package:soares_administradora_condominios/myhouse_page/components/header.myhouse.component.dart';


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
        ],
      ),
    );
  }
}
