import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/add.profile.image.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class HeaderCondominium extends StatefulWidget {
  const HeaderCondominium({super.key});

  @override
  State<HeaderCondominium> createState() => _HeaderCondominiumState();
}

class _HeaderCondominiumState extends State<HeaderCondominium> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  bool loading = false;

  loadImages() async {
    setState(() {
      loading = true;
    });
    final uid = FirebaseAuth.instance.currentUser!.uid.toString();
    Reference ref = storage.ref().child('images/${uid}_60x60.jpg');
    context.read<MyHouseBloc>().add(UpdateValueUserMyHouseEvent(
        'users', 'profileImageThumb', await ref.getDownloadURL()));
  }

  String url = '';
  String title = '';
  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final loginbloc = context.watch<LoginBloc>();
    final loginstate = loginbloc.state;

    if (loginstate is CompleteFetchUserResidentLoginState) {
      url = loginstate.resident.profileImage!;
      title = loginstate.resident.name;
      if (loginstate.resident.profileImage == 'ref') {
        loadImages();
        setState(() {
          loading = false;
        });
      }
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
                if (loginstate is CompleteFetchUserResidentLoginState)
                  loginstate.resident.profileImage == ''
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
                                        name: title,
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
                                    name: title,
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
                            child: loading ||
                                    loginstate.resident.profileImage == 'ref'
                                ? Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: CircularProgressIndicator(),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kBorderRadius),
                                    color: kWhite,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            loginstate.resident.profileImage!),
                                        fit: BoxFit.cover),
                                  )),
                          ),
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
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        //carregar o sistema novamente.
                      },
                    ),
                  ),
              ],
            ),
          ),
          Container(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      Icons.help_center,
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
