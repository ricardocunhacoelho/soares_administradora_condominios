import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.lost.found.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/lost_found/list.lost.found.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class LostFoundPage extends StatefulWidget {
  const LostFoundPage({super.key});

  @override
  State<LostFoundPage> createState() => _LostFoundPageState();
}

class _LostFoundPageState extends State<LostFoundPage> {
  @override
  Widget build(BuildContext context) {
    final fetchLostFoundBloc = context.watch<GetLostFoundBloc>();
    final fetchLostFoundState = fetchLostFoundBloc.state;

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
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text('Achados e perdidos',
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: kDarkBlue)),
            ),
            //LOADING
            if (fetchLostFoundState is LoadingGetLostFoundState)
              const Center(
                child: CircularProgressIndicator(),
              ),
            //GET LIST LOST FOUND COMPLETE
            if (fetchLostFoundState is CompleteGetLostFoundState)
              const ListLostFound(),
            //ERROR
            if (fetchLostFoundState is ErrorGetLostFoundState)
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
