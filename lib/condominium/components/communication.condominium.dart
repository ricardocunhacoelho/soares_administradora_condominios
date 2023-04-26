import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/condominium/components/item.communication.condominium.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import '../../app.style.dart';
import '../../size.config.dart';

import 'package:soares_administradora_condominios/myhouse_page/components/item.more.usual.dart';

class CommunicationCondominium extends StatelessWidget {
  const CommunicationCondominium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Comunicação',
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      color: kDarkBlue)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 20),
          child: Column(
            children: <Widget>[
              itemCommunicationCondominium('assets/megaphone.png', 'Falar com o condomínio',
                  'descrição aqui', Icons.message, 0, '/calledPage', context),
              itemCommunicationCondominium('assets/agenda3.png', 'Reserva de espaços',
                  'descrição aqui', Icons.edit_calendar_rounded, 0, 'rout', context),
              itemCommunicationCondominium('assets/maintenance2.png', 'Solicitar Manutenção',
                  'descrição aqui', Icons.build_rounded, 0, '/maintenancePage', context),
            ],
          ),
        ),
      ],
    );
  }
}
