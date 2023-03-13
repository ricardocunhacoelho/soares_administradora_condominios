import 'package:flutter/material.dart';

import '../app.style.dart';
import '../size.config.dart';
import 'post.frame.pagina.principal.dart';

import 'package:soares_administradora_condominios/pagina_principal/bottomtabbar.pagina.principal.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal>
    with CompleteStateMixinPaginaPrincipal {
  @override
  void completeState() {}

  int _indexSelecionado = 0;

  void _click(int index) {
    setState(() {
      _indexSelecionado = index;
    });
  }

  late final screens = [
    // const PaginaMinhaCasa(),
    // const PaginaCondominio(),
    // const PaginaMais(),
    Center(child: Text('PaginaMinhaCasa')),
    Center(child: Text('PaginaCondominio')),
    Center(child: Text('PaginaMais')),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: kLightWhite,
        body: IndexedStack(index: _indexSelecionado, children: screens),
        bottomNavigationBar: BottomTabBarLista(
          onChange: _click,
          indexSelecionado: _indexSelecionado,
        ));
  }
}
