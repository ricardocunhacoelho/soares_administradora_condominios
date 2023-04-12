import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class HomeServiceProviders extends StatefulWidget {
  final ResidentEntity resident;
  const HomeServiceProviders({super.key, required this.resident});

  @override
  State<HomeServiceProviders> createState() => _HomeServiceProvidersState();
}

class _HomeServiceProvidersState extends State<HomeServiceProviders> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<FetchUnitBloc>()
            .add(FetchHomeUnitFetchEvents(widget.resident.homeUnitEntity));
        Navigator.pushNamed(context, '/houseServiceProviderPage');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              height: SizeConfig.blockSizeHorizontal! * 25,
              decoration: BoxDecoration(
                  color: kLightBlue,
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
                    Container(
                        width: 40,
                        child: const Icon(
                          Icons.navigate_next_outlined,
                          size: 25,
                          color: kDarkBlue,
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
