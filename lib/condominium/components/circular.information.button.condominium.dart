import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/condominium/components/item.informarion.button.condominium.dart';

import '../../app.style.dart';
import '../../size.config.dart';

Widget circularInformationButtonCondominium(BuildContext context) {
  return Column(
    children: [
      Container(
        height: SizeConfig.blockSizeHorizontal! * 30,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            itemInformationButtonCondominium("assets/news.png",
                'Mural de Avisos', 0, '/residentsPage', context),
            itemInformationButtonCondominium("assets/calendar.png",
                'Calendário Cond.', 1, '/vehiclePage', context),
            itemInformationButtonCondominium("assets/lost.png",
                'Achados/Perdidos', 2, '/visitorPage', context),
            itemInformationButtonCondominium("assets/bad.png",
                'Enquetes e Votações', 2, '/visitorPage', context),
            itemInformationButtonCondominium("assets/employee.png",
                'Funcionários Cond.', 2, '/visitorPage', context),
          ],
        ),
      ),
    ],
  );
}
