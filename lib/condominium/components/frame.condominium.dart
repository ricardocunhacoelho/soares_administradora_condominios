import 'package:flutter/material.dart';

import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import '../../app.style.dart';
import '../../size.config.dart';

Widget frameCondominiumAdm(
  ResidentEntity resident,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: SizeConfig.blockSizeHorizontal! * 39,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: kDarkBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: SizedBox(
              width: 200,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/condominium_estrela.png'),
                                fit: BoxFit.contain),
                          )),
                      const SizedBox(width: 10),
                      Text('Condomínio Ed. Estrela',
                          style: kPoppinsSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              color: kWhite))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(
                        'Aproveite: mais de 20 recursos para nos conectarmos a você e suas necessidades.\nSoares Adm. Condomínios',
                        style: kPoppinsSemiBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: kWhite)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:20),
            child: Container(
                padding: EdgeInsets.only(left: 20),
                width: 100,
                child: GestureDetector(
                  onTap: () {
                    //abrir a imagem
                  },
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal! * 14,
                    height: SizeConfig.blockSizeHorizontal! * 21,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Image.asset('assets/logo.png', fit: BoxFit.contain),
                  ),
                )),
          )
        ],
      ),
    ),
  );
}
