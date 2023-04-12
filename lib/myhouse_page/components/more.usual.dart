import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import '../../app.style.dart';
import '../../size.config.dart';

import 'package:soares_administradora_condominios/myhouse_page/components/item.more.usual.dart';

class MoreUsual extends StatelessWidget {
  final ResidentEntity resident;
  const MoreUsual({Key? key, required this.resident}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mais Usuais',
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      color: kDarkBlue)),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: SizeConfig.blockSizeHorizontal! * 55,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ItemMoreUsual(
                "assets/qrcodeimage.png",
                'QRCODE',
                'assets/qrcode.png',
                'Acesso a todos os QRCODE da família. Sempre apresente o seu na portaria',
                0,
                '/allQrPage',
                context,
                resident,
              ),
              ItemMoreUsual(
                "assets/encomendafoto.png",
                'Encomendas',
                'assets/encomenda.png',
                'Confira encomendas aguardando retirada, avise o porteiro que está esperando encomenda ou consulte o histório retirada',
                1,
                'rout',
                context,
                resident,
              ),
              ItemMoreUsual(
                "assets/boletosfoto.png",
                'Boletos',
                'assets/boleto.png',
                'Segunda via de boletos e historico dos pagamentos',
                2,
                'rout',
                context,
                resident,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
