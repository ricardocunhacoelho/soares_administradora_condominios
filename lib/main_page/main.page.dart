import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/pages/condominium.page.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/pages/myhouse.page.dart';

import '../app.style.dart';
import '../size.config.dart';
import 'post.frame.main.page.dart';

import 'package:soares_administradora_condominios/main_page/bottomtabbar.main.page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  int _indexSelecionado = 0;

  void _click(int index) {
    setState(() {
      _indexSelecionado = index;
    });
  }

  late final screens = [
    const MyHouse(),
    const Condominium(),
    // const PaginaMais(),
    // Center(child: Text('PaginaMinhaCasa')),
    Center(child: Text('PaginaMais')),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final loginbloc = context.watch<LoginBloc>();
    final loginstate = loginbloc.state;

    return Scaffold(
        backgroundColor: kLightWhite,
        body: loginstate is CompleteFetchUserResidentLoginState
            ? IndexedStack(index: _indexSelecionado, children: screens)
            : const SizedBox(
                child: Center(child: CircularProgressIndicator())),
        bottomNavigationBar: loginstate is CompleteFetchUserResidentLoginState
            ? BottomTabBarList(
                onChange: _click,
                indexSelecionado: _indexSelecionado,
              )
            : null);
  }
}
