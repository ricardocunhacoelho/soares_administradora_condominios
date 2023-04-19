import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.news.wall.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/news_wall/list.news.wall.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class NewsWallPage extends StatefulWidget {
  const NewsWallPage({super.key});

  @override
  State<NewsWallPage> createState() => _NewsWallPageState();
}

class _NewsWallPageState extends State<NewsWallPage> {
  @override
  Widget build(BuildContext context) {
    final fetchNewsWallBloc = context.watch<GetNewsWallBloc>();
    final fetchNewsWallState = fetchNewsWallBloc.state;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.navigate_before,
                color: kDarkGrey,
                size: SizeConfig.blockSizeHorizontal! * 7.5,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        backgroundColor: kLightWhite,
        elevation: 0,
        actions: [
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
      backgroundColor: kLightWhite,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            //TITULO
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('Mural de Avisos',
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: kDarkBlue)),
            ),
            //LOADING
            if (fetchNewsWallState is LoadingGetNewsWallState)
              const Center(
                child: CircularProgressIndicator(),
              ),
            //REGISTERED RESIDENTS
            if (fetchNewsWallState is CompleteGetNewsWallState)
              const ListNewsWall(),
            //ERROR
            if (fetchNewsWallState is ErrorGetNewsWallState)
              Center(
                child: IconButton(
                    onPressed: () async {
                      //   context.read<FetchUnitBloc>().add(
                      //       FetchHomeUnitFetchEvents(
                      //           loginstate.resident.homeUnitEntity));
                    },
                    icon: const Icon(Icons.refresh)),
              ),
          ],
        ),
      ),
    );
  }
}
