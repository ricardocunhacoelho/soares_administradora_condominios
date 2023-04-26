import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/adm/lost_found/domain/entity/lost.found.entity.dart';
import 'package:soares_administradora_condominios/size.config.dart';

import '../../../app.style.dart';

class ItemLostFound extends StatefulWidget {
  final LostFoundEntity lostFound;

  const ItemLostFound({
    super.key,
    required this.lostFound,
  });

  @override
  State<ItemLostFound> createState() => _ItemLostFoundState();
}

class _ItemLostFoundState extends State<ItemLostFound> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Ink.image(
                    image: NetworkImage(widget.lostFound.image),
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kGrey,
                      ),
                      child: Text(
                        widget.lostFound.title,
                        style: kPoppinsBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 5,
                            color: kWhite),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.lostFound.details,
                      style: kPoppinsSemiBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                          color: kDarkBlue),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Data: ${widget.lostFound.foundDate.day}/${widget.lostFound.foundDate.month.toString().padLeft(2, '0')}/${widget.lostFound.foundDate.year}',
                      style: kPoppinsRegular.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          color: kDarkBlue),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
