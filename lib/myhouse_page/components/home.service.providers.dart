import 'package:flutter/material.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class HomeServiceProviders extends StatefulWidget {
  const HomeServiceProviders({super.key});

  @override
  State<HomeServiceProviders> createState() => _HomeServiceProvidersState();
}

class _HomeServiceProvidersState extends State<HomeServiceProviders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: SizeConfig.blockSizeHorizontal! * 19,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/service_providers.png'),
                            fit: BoxFit.contain),
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    'Adicionar, editar ou remover prestadores de serviço à minha casa ex. limpeza, alvenaria, manutenção...',
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
