import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/events/login.events.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';

import '../../app.style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  var controllerUser = TextEditingController();
  var controllerPass = TextEditingController();

  String? errorMsg;

  @override
  Widget build(BuildContext context) {
    final loginbloc = context.watch<LoginBloc>();
    final loginstate = loginbloc.state;
    return Scaffold(
        backgroundColor: kLightWhite,
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                children: [
                  Container(
                    color: Colors.blue.withOpacity(.3),
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controllerUser,
                          decoration: const InputDecoration(
                            label: Text('E-mail/usuario'),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controllerPass,
                          decoration: const InputDecoration(
                            label: Text('Senha'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () async {
                              String user = controllerUser.text;
                              String pass = controllerPass.text;
                              context.read<LoginBloc>().add(
                                  AuthenticateUserLoginEvent(user, pass));
                              if (loginstate
                                  is AuthenticateUserCompleteLoginState) {
                                final uid = FirebaseAuth
                                    .instance.currentUser!.uid
                                    .toString();
                                context
                                    .read<LoginBloc>()
                                    .add(FetchUserLoginEvent(uid));
                              }
                            },
                            child: const Text('Login')),
                      ],
                    ),
                  ),
                  if (loginstate is AuthenticateUserErrorLoginState)
                    Text(loginstate.message)
                ],
              )));
  }
}
