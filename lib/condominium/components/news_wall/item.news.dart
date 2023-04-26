import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soares_administradora_condominios/adm/news_wall/domain/entity/news.entity.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class ItemNews extends StatefulWidget {
  final NewsEntity news;

  const ItemNews({
    super.key,
    required this.news,
  });

  @override
  State<ItemNews> createState() => _ItemNewsState();
}

class _ItemNewsState extends State<ItemNews> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: widget.news.image == null
            ? ListTile(
                horizontalTitleGap: 18,
                contentPadding: const EdgeInsets.only(
                    left: 18, right: 18, top: 10, bottom: 10),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.news.title,
                      style: kPoppinsBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                          color: kDarkBlue),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Por: ${widget.news.author}',
                      style: kPoppinsRegular.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          color: kDarkBlue),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Em: ${widget.news.date.day}/${widget.news.date.month.toString().padLeft(2, '0')}/${widget.news.date.year}',
                      style: kPoppinsSemiBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          color: kDarkBlue),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.news.text,
                      style: kPoppinsRegular.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          color: kDarkBlue),
                    ),
                  ],
                ),
              )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Ink.image(
                        image: NetworkImage(widget.news.image!),
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
                            widget.news.title,
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
                          widget.news.text,
                          style: kPoppinsSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: kDarkBlue),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Dia: ${widget.news.date.day}/${widget.news.date.month.toString().padLeft(2, '0')}/${widget.news.date.year}',
                          style: kPoppinsRegular.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              color: kDarkBlue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
