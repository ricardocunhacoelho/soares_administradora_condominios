import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/add.profile.image.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class HeaderMyHouse extends StatefulWidget {
  const HeaderMyHouse({super.key});

  @override
  State<HeaderMyHouse> createState() => _HeaderMyHouseState();
}

class _HeaderMyHouseState extends State<HeaderMyHouse> {
  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final loginbloc = context.watch<LoginBloc>();
    final loginstate = loginbloc.state;
    return Container(
      color: kDarkBlue,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 250,
            child: Row(
              children: [
                if (loginstate is CompleteFetchUserHomeUnitLoginState)
                  loginstate.homeUnitEntity.profileImage == ''
                      ? Container(
                          height: 51,
                          width: 51,
                          child: Center(
                            child: IconButton(
                              icon: Icon(Icons.add_a_photo_outlined),
                              onPressed: () {
                                showDialog(
                                context: context,
                                builder: (_) {
                                  return AddProfileImageDialogComponente();
                                });
                              },
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            color: kLightWhite,
                          ))
                      : Container(
                          height: 51,
                          width: 51,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              color: kLightWhite,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      loginstate.homeUnitEntity.profileImage),
                                  fit: BoxFit.cover))),
                if (loginstate is LoadingFetchUserLoginState)
                  Container(
                    height: 51,
                    width: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: kLightWhite,
                    ),
                    child: const CircularProgressIndicator(),
                  ),
                if (loginstate is ErrorFetchUserLoginState)
                  Container(
                    height: 51,
                    width: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: kLightWhite,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {},
                    ),
                  ),
                SizedBox(width: 20),
                if (loginstate is CompleteFetchUserHomeUnitLoginState)
                  Container(
                    width: 150,
                    child: Expanded(
                      child: Text(
                          'Olá, Casa ${loginstate.homeUnitEntity.title}',
                          style: kPoppinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: kLightWhite)),
                    ),
                  ),
                if (loginstate is LoadingFetchUserLoginState)
                  CircularProgressIndicator(),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                auth.signOut();
              },
              child: Icon(
                Icons.logout_outlined,
                color: kLightWhite,
                size: SizeConfig.blockSizeHorizontal! * 7,
              )
              // ImageIcon(const AssetImage("assets/notif.png"),
              //     size: SizeConfig.blockSizeHorizontal! * 8.5,
              //     color: kLightWhite),

              ),
          GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.notifications,
                color: kLightWhite,
                size: SizeConfig.blockSizeHorizontal! * 7,
              )
              // ImageIcon(const AssetImage("assets/notif.png"),
              //     size: SizeConfig.blockSizeHorizontal! * 8.5,
              //     color: kLightWhite),

              ),
        ],
      ),
    );
  }
}
