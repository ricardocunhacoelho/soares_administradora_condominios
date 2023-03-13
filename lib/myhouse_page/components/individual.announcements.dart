import 'package:flutter/material.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class IndividualAnnouncements extends StatefulWidget {
  const IndividualAnnouncements({super.key});

  @override
  State<IndividualAnnouncements> createState() => _IndividualAnnouncementsState();
}

class _IndividualAnnouncementsState extends State<IndividualAnnouncements> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('Comunicados e notificações',
              style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kDarkBlue)),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            height: SizeConfig.blockSizeHorizontal! * 25,
            decoration: BoxDecoration(
                color: kLighterBlue,
                borderRadius: BorderRadius.circular(kBorderRadius),
                boxShadow: [
                  BoxShadow(
                      color: kDarkBlue.withOpacity(0.051),
                      offset: const Offset(0.0, 3.0),
                      blurRadius: 24.0,
                      spreadRadius: 0.0)
                ]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                          width: SizeConfig.blockSizeHorizontal! * 17,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/responda.png'),
                                fit: BoxFit.contain),
                          )),
                  const SizedBox(width: 15),
                  Expanded(
                      child: Text(
                    'Confira mensagens, notificações e avisos enviados pela administração do condomínio para você.',
                    style: kPoppinsMedium.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3),
                  )),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
