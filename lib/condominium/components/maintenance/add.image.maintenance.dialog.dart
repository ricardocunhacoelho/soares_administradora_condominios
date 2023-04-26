import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/condominium/components/maintenance/controller/maintenance.controller.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class AddImageMaintenanceDialog extends StatefulWidget {
  final MaintenanceController controller;

  const AddImageMaintenanceDialog({super.key, required this.controller});
  @override
  _AddImageMaintenanceDialogState createState() => new _AddImageMaintenanceDialogState();
}

class _AddImageMaintenanceDialogState extends State<AddImageMaintenanceDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Insira uma foto do local que precisa de manutenção',
              style: kPoppinsMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 4,
                color: kDarkBlue,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kBlue,
                  ),
                  child: TextButton(
                      onPressed: () async {
                        await widget.controller.getImageGallery();
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: SizeConfig.blockSizeHorizontal! * 9.5,
                                height: SizeConfig.blockSizeHorizontal! * 9.5,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                  image: const DecorationImage(
                                      image: AssetImage('assets/gallery.png'),
                                      fit: BoxFit.contain),
                                )),
                            Text(
                              'Escolher foto',
                              style: kPoppinsSemiBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                                color: kLightWhite,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: Colors.orangeAccent,
                  ),
                  child: TextButton(
                      onPressed: () async {
                        await widget.controller.getImageCamera();
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: SizeConfig.blockSizeHorizontal! * 9.5,
                                height: SizeConfig.blockSizeHorizontal! * 9.5,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                  image: const DecorationImage(
                                      image: AssetImage('assets/camera.png'),
                                      fit: BoxFit.contain),
                                )),
                            Text(
                              'Tirar foto',
                              style: kPoppinsSemiBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                                color: kLightWhite,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
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
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    color: kLightWhite,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
