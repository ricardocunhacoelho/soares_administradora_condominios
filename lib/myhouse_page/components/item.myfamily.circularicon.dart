import 'package:flutter/material.dart';

import '../../app.style.dart';
import '../../size.config.dart';

Widget ItemMyFamilyCircularIcon(
    String image, String nome, int index, String route, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, route);
    },
    child: Column(
      children: [
        Container(
          width: SizeConfig.blockSizeHorizontal! * 18,
          height: SizeConfig.blockSizeHorizontal! * 18,
          padding: const EdgeInsets.all(10),
          margin: index == 3
              ? const EdgeInsets.only(right: 20)
              : index == 0
                  ? const EdgeInsets.only(left: 20, right: 25)
                  : const EdgeInsets.only(right: 25),
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
              ? const EdgeInsets.only(right: 20)
              : index == 0
                  ? const EdgeInsets.only(left: 20, right: 20)
                  : const EdgeInsets.only(right: 20),
          child: Text(nome,
              style: kDoppio_One.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  color: kDarkBlue)),
        ))
      ],
    ),
  );
}
