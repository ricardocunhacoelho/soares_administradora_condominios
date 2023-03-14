import 'package:flutter/material.dart';

import 'package:soares_administradora_condominios/login_page/auth_interface.dart';
import 'package:soares_administradora_condominios/login_page/custom_firebase_auth.dart';

import '../app.style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  final AuthInterface _auth = CustomFirebaseAuth();

  var controllerUser = TextEditingController();
  var controllerPass = TextEditingController();

  String? errorMsg;

  @override
  Widget build(BuildContext context) {
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

                              var result = await _auth.login(user, pass);
                              if (result.isSuccess) {
                                setState(() => errorMsg = null);
                                print('Sucess Login');
                              } else {
                                setState(() => errorMsg = result.msgError);
                              }
                            },
                            child: const Text('Login')),
                      ],
                    ),
                  ),
                  if (errorMsg != null) Text(errorMsg!)
                ],
              )));
  }
}
