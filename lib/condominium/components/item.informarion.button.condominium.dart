import 'package:flutter/material.dart';

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(13),
          width: SizeConfig.blockSizeHorizontal! * 13,
          height: SizeConfig.blockSizeHorizontal! * 13,
          margin: index == 4
          ? const EdgeInsets.only(right: 20)
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
          child: ImageIcon(
            AssetImage(image),
            color: kDarkBlue,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.topLeft,
          height: 30,
          width: 95,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                margin: index == 4
          ? const EdgeInsets.only(right: 20)
          : index == 0
              ? const EdgeInsets.only(left: 25, right: 20)
              : const EdgeInsets.only(right: 20),
                child: Text(
                  nome,
                  style: kDoppio_One.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      color: kDarkBlue),
                  textAlign: TextAlign.center,
                ),
              )),
            ],
          ),
        )
      ],
    ),
  );
}
