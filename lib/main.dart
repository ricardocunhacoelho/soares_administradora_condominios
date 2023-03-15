import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'package:soares_administradora_condominios/main_page/main.page.dart';
import 'package:soares_administradora_condominios/login_page/login.page.dart';
import 'package:soares_administradora_condominios/main_page/loading.page.dart';
import 'package:soares_administradora_condominios/main_page/error.page.dart';

import 'package:soares_administradora_condominios/test_storage/test.storage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _inicializacao = Firebase.initializeApp();
  var auth = FirebaseAuth.instance;
  var _isLogin = false;

  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          _isLogin = true;
        });
      } else {
        setState(() {
          _isLogin = false;
        });
      }
    });
  }

  @override
  void initState() {
    checkIfLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (_) => _isLogin
            ? FutureBuilder(
                future: _inicializacao,
                builder: (context, app) {
                  if (app.connectionState == ConnectionState.done) {
                    return const MainPage();
                  }
                  if (app.hasError) {
                    return const ErrorPage();
                  }
                  return const LoadingPage();
                })
            : LoginPage(),
      },
      title: 'Soares Administradora de Condomínios',
    );
  }
}
