import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/fetch.user.login.bloc.dart';
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
  String url = '';
  int _imageVersion = 1;

  Future<void> _refreshImage() async {
    //call API & update the image
    _imageVersion++;
    setState(() {});
        print('version : $_imageVersion');

  }


  @override
  Widget build(BuildContext context) {
    final fetchUserBloc = context.watch<FetchUserBloc>();
    final fetchUserState = fetchUserBloc.state;
    if (fetchUserState is CompleteFetchUserResidentLoginState) {
      url = fetchUserState.resident.profileImageThumb!;
      _refreshImage();
    }
    return Container(
      height: 100,
      color: kDarkBlue,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                if (fetchUserState is CompleteFetchUserResidentLoginState)
                  fetchUserState.resident.profileImageThumb == ''
                      ? Container(
                          height: 51,
                          width: 51,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            color: kLightWhite,
                          ),
                          child: Center(
                            child: IconButton(
                              icon: Icon(Icons.add_a_photo_outlined),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AddProfileImageDialogComponente(
                                        name: fetchUserState.resident.name,
                                        attImage1: _refreshImage,
                                      );
                                    });
                              },
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AddProfileImageDialogComponente(
                                    name: fetchUserState.resident.name,
                                    attImage1: _refreshImage,
                                  );
                                });
                          },
                          child: Container(
                            height: 51,
                            width: 51,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              color: kLightWhite,
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              color: kWhite,
                              image: DecorationImage(
                                  image: NetworkImage(url + '#' + _imageVersion.toString()),
                                  fit: BoxFit.cover),
                            )),
                          ),
                        ),
                if (fetchUserState is ErrorFetchUserLoginState)
                  Container(
                    height: 51,
                    width: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: kLightWhite,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        //carregar o sistema novamente.
                      },
                    ),
                  ),
                const SizedBox(width: 20),
                Container(
                  width: 130,
                  child: fetchUserState is CompleteFetchUserResidentLoginState
                      ? Container(
                          child: Text(
                              'Olá, ${fetchUserState.resident.name.split(' ')[0]}!',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kPoppinsBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                color: kLightWhite,
                              )),
                        )
                      : SizedBox(
                          width: 130,
                        ),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      auth.signOut();
                    },
                    child: Icon(
                      Icons.logout_outlined,
                      color: kLightWhite,
                      size: SizeConfig.blockSizeHorizontal! * 7.5,
                    )),
                const SizedBox(width: 10),
                GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.notifications,
                      color: kLightWhite,
                      size: SizeConfig.blockSizeHorizontal! * 7.5,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
