import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import '../../app.style.dart';
import '../../size.config.dart';

Widget itemInformationButtonCondominium(
  String image,
  String nome,
  int index,
  String route,
  BuildContext context,
) {
  return GestureDetector(
    onTap: () {
      // context
      //     .read<FetchUnitBloc>()
      //     .add(FetchHomeUnitFetchEvents(resident.homeUnitEntity));
      Navigator.pushNamed(context, route);
    },
    child: Column(
      children: [
        Container(
          width: SizeConfig.blockSizeHorizontal! * 10,
          height: SizeConfig.blockSizeHorizontal! * 10,
          padding: const EdgeInsets.all(5),
          margin: index == 3
              ? const EdgeInsets.only(right: 15)
              : index == 0
                  ? const EdgeInsets.only(left: 25, right: 20)
                  : const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: new Offset(1.0, 1.0),
                blurRadius: 5,
                color: kDarkBlue.withOpacity(0.051),
                spreadRadius: 2,
              )
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(
                67,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageIcon(
              AssetImage(image),
              color: kDarkBlue,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
            child: Container(
          margin: index == 4
              ? const EdgeInsets.only(right: 15)
              : index == 0
                  ? const EdgeInsets.only(left: 25, right: 15)
                  : const EdgeInsets.only(right: 15),
          child: Text(nome,
              style: kDoppio_One.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  color: kDarkBlue)),
        ))
      ],
    ),
  );
}
