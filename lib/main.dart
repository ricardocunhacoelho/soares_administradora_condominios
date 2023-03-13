import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:soares_administradora_condominios/main_page/main.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/': (_) => const MainPage(),
        },
        title: 'Soares Administradora de Condomínios',
      );
    
  }
}
