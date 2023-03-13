import 'package:flutter/material.dart';
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

class _MainPageState extends State<MainPage>
    with CompleteStateMixinMainPage {
  @override
  void completeState() {}

  int _indexSelecionado = 0;

  void _click(int index) {
    setState(() {
      _indexSelecionado = index;
    });
  }

  late final screens = [
    const MyHouse(),
    // const PaginaCondominio(),
    // const PaginaMais(),
    // Center(child: Text('PaginaMinhaCasa')),
    Center(child: Text('PaginaCondominio')),
    Center(child: Text('PaginaMais')),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: kLightWhite,
        body: IndexedStack(index: _indexSelecionado, children: screens),
        bottomNavigationBar: BottomTabBarList(
          onChange: _click,
          indexSelecionado: _indexSelecionado,
        ));
  }
}
