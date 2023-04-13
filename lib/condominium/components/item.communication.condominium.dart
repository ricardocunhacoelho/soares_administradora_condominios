import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';

import '../../app.style.dart';
import '../../size.config.dart';

Widget itemCommunicationCondominium(
  String image,
  String title,
  String details,
  IconData icon,
  int index,
  String route,
  BuildContext context,
) {
  return ListTile(
    onTap: () {
      // context
      //     .read<FetchUnitBloc>()
      //     .add(FetchHomeUnitFetchEvents(resident.homeUnitEntity));
      Navigator.pushNamed(context, route);
    },
    horizontalTitleGap: 18,
    contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
    trailing: Container(
      width: 60,
      height: 60,
      child: Icon(icon),
    ),
    title: Text(title,
        style: kPoppinsMedium.copyWith(
            fontSize: SizeConfig.blockSizeHorizontal! * 3.5, color: kDarkBlue)),
    subtitle: Text(details,
        style: kPoppinsBold.copyWith(
            fontSize: SizeConfig.blockSizeHorizontal! * 3.5, color: kDarkBlue)),
    leading: Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.contain),
      ),
    ),
  );
}