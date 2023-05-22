import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/reserve.entity.dart';

import 'package:soares_administradora_condominios/myhouse_page/controler/qr.controller.dart';

import '../../../../app.style.dart';
import '../../../../size.config.dart';


class ForShareQrReserveDialog extends StatefulWidget {
  final ReserveEntity reserve;

  const ForShareQrReserveDialog({super.key, required this.reserve});
  @override
  _ForShareQrReserveDialogState createState() => new _ForShareQrReserveDialogState();
}

class _ForShareQrReserveDialogState extends State<ForShareQrReserveDialog> {
  QrShareController controller = QrShareController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      content: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Screenshot(
                controller: controller.screenshotController,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(widget.reserve.motivation,
                          style: kPoppinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: kDarkBlue)),
                      const SizedBox(height: 10),
                      Text(widget.reserve.areaCondominium.title,
                          style: kPoppinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: kDarkBlue)),
                      const SizedBox(height: 10),
                      Container(
                          width: 200,
                          height: 200,
                          child: QrImage(
                            data: widget.reserve.id,
                            size: 200,
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kBlue,
                ),
                child: TextButton(
                    onPressed: () {
                      controller.shareQrCode();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Compartilhar Qr',
                        style: kPoppinsSemiBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                          color: kLightWhite,
                        ),
                      ),
                    )),
              ),
            ],
          )),
      actions: [
        Container(
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: kGrey,
          ),
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Voltar',
                  style: kPoppinsSemiBold.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    color: kLightWhite,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
