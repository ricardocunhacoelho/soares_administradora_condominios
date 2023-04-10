import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import '../../app.style.dart';
import '../../size.config.dart';

import 'package:soares_administradora_condominios/myhouse_page/components/item.myfamily.circularicon.dart';

Widget myFamilyCircularIcons(
    BuildContext context, ResidentEntity resident, MyHouseStates myHouseState) {
  return Column(
    children: [
      Container(
        height: SizeConfig.blockSizeHorizontal! * 25,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            itemMyFamilyCircularIcon("assets/family.png", 'Moradores', 0,
                '/residentsPage', context, resident, myHouseState),
            itemMyFamilyCircularIcon("assets/traffic-jam.png", 'Veículos', 1,
                '/vehiclePage', context, resident, myHouseState),
            itemMyFamilyCircularIcon("assets/visitor.png", 'Visitantes', 2,
                '/visitorPage', context, resident, myHouseState),
          ],
        ),
      ),
    ],
  );
}
