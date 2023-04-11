import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import '../../app.style.dart';
import '../../size.config.dart';

Widget ItemMoreUsual(
  String image,
  String title,
  String icon,
  String details,
  int index,
  String route,
  BuildContext context,
  ResidentEntity resident,
) {
  return GestureDetector(
    onTap: (() {
      context
          .read<FetchUnitBloc>()
          .add(FetchHomeUnitFetchEvents(resident.homeUnitEntity));
      Navigator.pushNamed(context, route);
    }),
    child: Container(
      margin: index == 5
          ? const EdgeInsets.only(right: 20)
          : index == 0
              ? const EdgeInsets.only(left: 20, right: 20)
              : const EdgeInsets.only(right: 20),
      height: 304,
      width: 185,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: kWhite,
          boxShadow: [
            BoxShadow(
                color: kDarkBlue.withOpacity(0.091),
                offset: const Offset(0.0, 3.0),
                blurRadius: 24.0,
                spreadRadius: 0.0)
          ]),
      child: Column(
        children: [
          Container(
            height: SizeConfig.blockSizeHorizontal! * 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kBorderRadius),
                    topRight: Radius.circular(kBorderRadius)),
                color: kWhite,
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          const SizedBox(height: 15),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 130,
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: kPoppinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: Colors.deepOrangeAccent),
                        ),
                      ),
                      ImageIcon(
                        AssetImage(icon),
                        size: SizeConfig.blockSizeHorizontal! * 5,
                        color: Colors.deepOrangeAccent,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    details,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: kPoppinsRegular.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        color: kDarkGrey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
