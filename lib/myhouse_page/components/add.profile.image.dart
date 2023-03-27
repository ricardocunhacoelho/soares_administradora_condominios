import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/controler/profile.image.controller.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class AddProfileImageDialogComponente extends StatefulWidget {
  final String name;

  const AddProfileImageDialogComponente({super.key, required this.name});
  @override
  _AddProfileImageDialogComponenteState createState() =>
      new _AddProfileImageDialogComponenteState();
}

class _AddProfileImageDialogComponenteState
    extends State<AddProfileImageDialogComponente> {
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = false;

  loadImages() async {
    setState(() {
      loading = true;
    });
    final uid = FirebaseAuth.instance.currentUser!.uid.toString();
    Reference ref = storage.ref().child('images/${uid}_60x60.jpg');
    context.read<MyHouseBloc>().add(UpdateValueUserUsecaseMyHouseEvent(
        'home_units', await ref.getDownloadURL()));
  }

  final FirebaseStorage storage = FirebaseStorage.instance;

  updateValueUser() {
    context
        .read<MyHouseBloc>()
        .add(UpdateValueUserUsecaseMyHouseEvent('home_units', 'ref'));
  }

  late final controller = ProfileImageController(() {
    setState(() {});
  }, '', updateValueUser);

  @override
  Widget build(BuildContext context) {
    final loginbloc = context.watch<LoginBloc>();
    final loginstate = loginbloc.state;

    if (loginstate is CompleteFetchUserHomeUnitLoginState) {
      setState(() {
        controller.url = loginstate.homeUnitEntity.profileImage!;
      });
      if (loginstate.homeUnitEntity.profileImage == 'ref') {
        loadImages();
        setState(() {
          loading = false;
        });
      }
    }
    return AlertDialog(
      backgroundColor: kLightGrey,
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (loginstate is CompleteFetchUserHomeUnitLoginState)
              controller.url == ''
                  ? Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        color: kLightWhite,
                      ),
                      child: Center(
                          child: controller.uploading == false
                              ? IconButton(
                                  icon: Icon(Icons.add_a_photo_outlined),
                                  onPressed: () {
                                    controller.pickAndUploadImage();
                                  })
                              : Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          'Carregando ${controller.total.round()}%',
                                          style: kPoppinsBold.copyWith(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3,
                                            color: kDarkBlue,
                                          )),
                                      const SizedBox(height: 10),
                                      const CircularProgressIndicator(),
                                    ],
                                  ),
                                )))
                  : Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        color: kLightWhite,
                      ),
                      child: loading ||
                              controller.uploading ||
                              loginstate.homeUnitEntity.profileImage == 'ref'
                          ? const Padding(
                              padding: EdgeInsets.all(10),
                              child: CircularProgressIndicator(),
                            )
                          : Image(
                              image: NetworkImage(
                                  loginstate.homeUnitEntity.profileImage!),
                              fit: BoxFit.cover),
                    ),
            const SizedBox(height: 15),
            Text('Casa ${widget.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kLightWhite,
                )),
            const SizedBox(height: 15),
            if (loginstate is CompleteFetchUserHomeUnitLoginState)
              Column(
                children: [
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: kLightWhite,
                    ),
                    child: TextButton(
                        onPressed: controller.uploading
                            ? null
                            : () {
                                controller.pickAndUploadImage();
                              },
                        child: controller.uploading
                            ? const Padding(
                                padding: EdgeInsets.all(10),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            : Text('Escolher foto',
                                style: kPoppinsBold.copyWith(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                                  color: kBlue,
                                ))),
                  ),
                  if (controller.url != '' &&
                      loginstate.homeUnitEntity.profileImage != 'ref')
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            color: kLightWhite,
                          ),
                          child: TextButton(
                              onPressed: () {
                                // controller.deleteImage(
                                //     loginstate.homeUnitEntity.profileImage);
                              },
                              child: controller.uploading
                                  ? const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                    )
                                  : Text('Deletar Imagem',
                                      style: kPoppinsBold.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 3,
                                        color: kBlue,
                                      ))),
                        ),
                      ],
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
