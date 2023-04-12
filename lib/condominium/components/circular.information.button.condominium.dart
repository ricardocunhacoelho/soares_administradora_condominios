import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/condominium/components/item.informarion.button.condominium.dart';

import '../../app.style.dart';
import '../../size.config.dart';


Widget circularInformationButtonCondominium(
    BuildContext context) {
  return Column(
    children: [
      Container(
        height: SizeConfig.blockSizeHorizontal! * 15,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            itemInformationButtonCondominium("assets/family.png", 'Moradores', 0,
                '/residentsPage', context),
            itemInformationButtonCondominium("assets/traffic-jam.png", 'Veículos', 1,
                '/vehiclePage', context),
            itemInformationButtonCondominium("assets/visitor.png", 'Visitantes', 2,
                '/visitorPage', context),
          ],
        ),
      ),
    ],
  );
}
