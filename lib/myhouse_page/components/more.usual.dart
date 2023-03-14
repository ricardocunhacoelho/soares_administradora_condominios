import 'package:flutter/material.dart';

import '../../app.style.dart';
import '../../size.config.dart';

import 'package:soares_administradora_condominios/myhouse_page/components/item.more.usual.dart';

class MoreUsual extends StatelessWidget {
  const MoreUsual({Key? key}) : super(key: key);

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
                image:
                    "assets/qrcodeimage.png",
                title: 'QRCODE',
                icon: 'assets/qrcode.png',
                details:
                    'Acesso a todos os QRCODE da família. Sempre apresente o seu na portaria',
                index: 0,
              ),
              ItemMoreUsual(
                image:
                    "assets/encomendafoto.png",
                title: 'Encomendas',
                icon: 'assets/encomenda.png',
                details:
                    'Confira encomendas aguardando retirada, avise o porteiro que está esperando encomenda ou consulte o histório retirada',
                index: 1,
              ),
              ItemMoreUsual(
                image:
                    "assets/boletosfoto.png",
                title: 'Boletos',
                icon: 'assets/boleto.png',
                details: 'Segunda via de boletos e historico dos pagamentos',
                index: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
