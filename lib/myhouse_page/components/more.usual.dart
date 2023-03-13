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
                    "https://images.prismic.io/portal-de-planos/bb71d223-1dbd-4ee9-b877-2ed2d7893652_como-ler-qr-code.webp?auto=compress,format&rect=0,59,724,366&w=740&h=374",
                title: 'QRCODE',
                icon: 'assets/qrcode.png',
                details:
                    'Acesso a todos os QRCODE da família. Sempre apresente o seu na portaria',
                index: 0,
              ),
              ItemMoreUsual(
                image:
                    "https://conviverapp.com.br/contrate/wp-content/uploads/2021/10/O-condom%C3%ADnio-pode-proibir-o-recebimento-das-encomendas-dos-moradores.jpg",
                title: 'Encomendas',
                icon: 'assets/encomenda.png',
                details:
                    'Confira encomendas aguardando retirada, avise o porteiro que está esperando encomenda ou consulte o histório retirada',
                index: 1,
              ),
              ItemMoreUsual(
                image:
                    "https://blog.bompracredito.com.br/wp-content/uploads/como-organizar-contas-conferir-bpc.png",
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
