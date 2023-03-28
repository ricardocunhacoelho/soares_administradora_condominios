import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/residents/registered.residents.component.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class ResidentPage extends StatefulWidget {
  const ResidentPage({super.key});

  @override
  State<ResidentPage> createState() => _ResidentPageState();
}

class _ResidentPageState extends State<ResidentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            //TITULO
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('Moradores',
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: kDarkBlue)),
            ),
            //REGISTERED RESIDENTS
            const RegisteredResidents(),
          ],
        ),
      ),
    );
  }
}
