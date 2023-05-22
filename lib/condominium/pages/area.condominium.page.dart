import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.area.condominium.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/list.area.condominium.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/reserves/list.reserve.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';
import 'package:soares_administradora_condominios/login/bloc/fetch.user.login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class AreaCondominiumPage extends StatefulWidget {
  const AreaCondominiumPage({super.key});

  @override
  State<AreaCondominiumPage> createState() => _AreaCondominiumPageState();
}

class _AreaCondominiumPageState extends State<AreaCondominiumPage> {
  int _indiceAtual = 0;

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fetchAreaCondominiumBloc = context.watch<GetAreaCondominiumBloc>();
    final fetchAreaCondominiumState = fetchAreaCondominiumBloc.state;

    final fetchUserBloc = context.watch<FetchUserBloc>();
    final fetchUserState = fetchUserBloc.state;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: SizeConfig.blockSizeHorizontal! * 7.5,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Espaços',
            icon: Icon(Icons.house),
          ),
          BottomNavigationBarItem(
            label: 'Minhas Reservas',
            icon: Icon(Icons.calendar_month),
          ),
        ],
      ),
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
      body: _indiceAtual == 0
          ? SafeArea(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 40),
                children: [
                  //TITULO
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Text('Reservar espaços do condomínio',
                        style: kPoppinsBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 5,
                            color: kDarkBlue)),
                  ),
                  //LOADING
                  if (fetchAreaCondominiumState
                      is LoadingGetAreaCondominiumState)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  //GET LIST LOST FOUND COMPLETE
                  if (fetchAreaCondominiumState
                      is CompleteGetAreaCondominiumState)
                    const ListAreaCondominium(),
                  //ERROR
                  if (fetchAreaCondominiumState is ErrorGetAreaCondominiumState)
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
            )
          : SafeArea(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 40),
                children: [
                  //TITULO
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Text('Minhas Reservas',
                        style: kPoppinsBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 5,
                            color: kDarkBlue)),
                  ),
                  //LOADING
                  if (fetchUserState is LoadingFetchUserLoginState)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  //GET LIST LOST FOUND COMPLETE
                  if (fetchUserState is CompleteFetchUserResidentLoginState)
                    fetchUserState.resident.reserves.isEmpty
                        ? Container(
                            child: Center(
                                child: Text('Não há reservas',
                                    style: kPoppinsBold.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 4,
                                        color: kDarkBlue))),
                          )
                        : ListReserves(),
                  //ERROR
                  if (fetchUserState is ErrorFetchUserLoginState)
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
