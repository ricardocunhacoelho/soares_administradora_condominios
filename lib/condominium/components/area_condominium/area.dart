import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';
import 'package:soares_administradora_condominios/condominium/bloc/fetch.area.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/form.reservation.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class Args {
  final AreaCondominiumEntity area;

  Args(this.area);
}

class AreaPage extends StatefulWidget {
  static const routeName = '/areaPage';

  const AreaPage({super.key});

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Args;

    return Scaffold(
      backgroundColor: kLightWhite,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: kDarkGrey,
                      size: SizeConfig.blockSizeHorizontal! * 7.5,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.help_center,
                      color: kDarkGrey,
                      size: SizeConfig.blockSizeHorizontal! * 7.5,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Center(
                child: Text(args.area.title,
                    style: kPoppinsBold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        color: kDarkBlue)),
              ),
            ),
            //IMAGE
            AspectRatio(
              aspectRatio: 0.85,
              child: PageView.builder(
                itemCount: args.area.carouselImage.length,
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return carouselView(args.area.carouselImage, index);
                },
              ),
            ),
            SizedBox(height: 12),
            //DESCRIPTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descrição:',
                    style: kPoppinsSemiBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                      color: kDarkBlue,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    args.area.description,
                    style: kPoppinsMedium.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      color: kDarkBlue,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Regras:',
                    style: kPoppinsSemiBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                      color: kDarkBlue,
                    ),
                  ),
                  SizedBox(height: 12),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: args.area.rules.length,
                      itemBuilder: (context, index) {
                        return Text(
                          '${index + 1}. ${args.area.rules[index]}',
                          style: kPoppinsMedium.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            color: kDarkBlue,
                          ),
                          textAlign: TextAlign.justify,
                        );
                      }),
                  SizedBox(height: 25),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orangeAccent),
                          ),
                          onPressed: () async {
                            context
                                .read<FetchAreaBloc>()
                                .add(FetchAreaCondominiumEvent(args.area.id));
                            Navigator.pushNamed(context, '/formReservationPage');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Seguir com Reserva',
                              style: kPoppinsSemiBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                                color: kLightWhite,
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            )

            // Container(
            //     width: 200,
            //     height: 200,
            //     decoration: BoxDecoration(
            //       color: kWhite,
            //       image: DecorationImage(
            //           image: NetworkImage(args.area.image!), fit: BoxFit.cover),
            //     )),
          ],
        ),
      ),
    );
  }

  Widget carouselView(List<dynamic> list, int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.028).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselImage(list[index]),
        );
      },
    );
  }

  Widget carouselImage(String data) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  image: DecorationImage(
                      image: NetworkImage(data), fit: BoxFit.cover),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black26)
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
