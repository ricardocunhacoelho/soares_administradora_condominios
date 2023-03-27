import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class RegisteredResidents extends StatefulWidget {
  const RegisteredResidents({super.key});

  @override
  State<RegisteredResidents> createState() => _RegisteredResidentsState();
}

class _RegisteredResidentsState extends State<RegisteredResidents> {
  @override
  Widget build(BuildContext context) {
    final loginbloc = context.watch<LoginBloc>();
    final loginstate = loginbloc.state;
    return Column(
      children: <Widget>[
        if (loginstate is CompleteFetchUserHomeUnitLoginState)
          loginstate.homeUnitEntity.residents.isNotEmpty
              ? Container()
              : GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/registerResidentForm');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          boxShadow: [
                            BoxShadow(
                                color: kDarkBlue.withOpacity(0.051),
                                offset: const Offset(0.0, 3.0),
                                blurRadius: 24.0,
                                spreadRadius: 0.0)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/cadastro.png'),
                                      fit: BoxFit.contain),
                                )),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                  'Você ainda não cadastrou moradores. Toque para cadastrar.',
                                  style: kPoppinsMedium.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3.5,
                                      color: kDarkBlue)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
      ],
    );
  }
}
