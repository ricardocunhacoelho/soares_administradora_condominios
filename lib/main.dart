import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/events/login.events.dart';
import 'package:soares_administradora_condominios/user/user.modules.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'package:soares_administradora_condominios/home_unit/home.unit.modules.dart';
import 'package:soares_administradora_condominios/login/login.modules.dart';

import 'package:soares_administradora_condominios/main_page/main.page.dart';
import 'package:soares_administradora_condominios/login/pages/login.page.dart';
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
          print(user.uid);
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
    return MultiProvider(
      providers: [
        ...UserModules,
        ...loginModules,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/': (_) => _isLogin
              ? FutureBuilder(
                  future: _inicializacao,
                  builder: (context, app) {
                    if (app.connectionState == ConnectionState.done) {
                      final uid =
                          FirebaseAuth.instance.currentUser!.uid.toString();
                      context
                          .read<LoginBloc>()
                          .add(FetchUserLoginEvent(uid));
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
      ),
    );
  }
}
