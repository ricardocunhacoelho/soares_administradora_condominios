import 'package:flutter/material.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class ItemMoreUsual extends StatelessWidget {
  final String image;
  final String title;
  final String icon;
  final String details;
  final int index;
  ItemMoreUsual(
      {required this.image,
      required this.title,
      required this.icon,
      required this.index,
      required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    image: NetworkImage(image), fit: BoxFit.cover)),
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
    );
  }
}
