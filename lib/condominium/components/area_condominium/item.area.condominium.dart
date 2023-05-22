import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/area.dart';
import 'package:soares_administradora_condominios/size.config.dart';

import '../../../app.style.dart';

class ItemAreaCondominium extends StatefulWidget {
  final AreaCondominiumEntity areaCondominium;

  const ItemAreaCondominium({
    super.key,
    required this.areaCondominium,
  });

  @override
  State<ItemAreaCondominium> createState() => _ItemAreaCondominiumState();
}

class _ItemAreaCondominiumState extends State<ItemAreaCondominium> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/areaPage',
            arguments: Args(widget.areaCondominium));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            child: Column(
              children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Ink.image(
                            image: NetworkImage(widget.areaCondominium.carouselImage[0]),
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 16,
                            right: 16,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kDarkBlue,
                              ),
                              child: Text(
                                widget.areaCondominium.title,
                                style: kPoppinsBold.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 5,
                                    color: kWhite),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.areaCondominium.description,
                        style: kPoppinsSemiBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            color: kDarkBlue),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const ImageIcon(
                                    AssetImage("assets/money.png"),
                                    size: 28,
                                    color: Colors.greenAccent,
                                  ),
                                  Text(widget.areaCondominium.price.toString()),
                                ],
                              )),
                          SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const ImageIcon(
                                    AssetImage("assets/group.png"),
                                    size: 28,
                                    color: kDarkBlue,
                                  ),
                                  Text(widget.areaCondominium.numberOfPeople
                                      .toString()),
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
