import 'package:flutter/material.dart';

import '../../app.style.dart';
import '../../size.config.dart';

import 'package:soares_administradora_condominios/myhouse_page/components/item.myfamily.circularicon.dart';

class MyFamilyCircularIcons extends StatelessWidget {
  const MyFamilyCircularIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Minha Família',
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      color: kDarkBlue)),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: SizeConfig.blockSizeHorizontal! * 25,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ItemMyFamilyCircularIcon(
                image: "assets/family.png",
                nome: 'Moradores',
                index: 0,
              ),
              ItemMyFamilyCircularIcon(
                image: "assets/traffic-jam.png",
                nome: 'Veículos',
                index: 1,
              ),
              ItemMyFamilyCircularIcon(
                image: "assets/visitor.png",
                nome: 'Visitantes',
                index: 2,
              ),
             
            ],
          ),
        ),
      ],
    );
  }
}
