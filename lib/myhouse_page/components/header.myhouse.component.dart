import 'package:flutter/material.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class HeaderMyHouse extends StatefulWidget {
  const HeaderMyHouse({super.key});

  @override
  State<HeaderMyHouse> createState() => _HeaderMyHouseState();
}

class _HeaderMyHouseState extends State<HeaderMyHouse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkBlue,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 250,
            child: Row(
              children: [
                Container(
                    height: 51,
                    width: 51,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        color: kLightWhite,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://img.cancaonova.com/cnimages/canais/uploads/sites/6/2017/05/formacao_a-familia-foi-criada-por-deus-para-ser-a-base-da-sociedade-1.jpg'),
                            fit: BoxFit.cover))),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bom dia',
                        style: kPoppinsSemiBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: kLightWhite)),
                    Text('Olá, Familia Muniz',
                        style: kPoppinsBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            color: kLightWhite)),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.logout_outlined,
                color: kLightWhite,
                size: SizeConfig.blockSizeHorizontal! * 7,
              )
              // ImageIcon(const AssetImage("assets/notif.png"),
              //     size: SizeConfig.blockSizeHorizontal! * 8.5,
              //     color: kLightWhite),

              ),
          GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.notifications,
                color: kLightWhite,
                size: SizeConfig.blockSizeHorizontal! * 7,
              )
              // ImageIcon(const AssetImage("assets/notif.png"),
              //     size: SizeConfig.blockSizeHorizontal! * 8.5,
              //     color: kLightWhite),

              ),
        ],
      ),
    );
  }
}
