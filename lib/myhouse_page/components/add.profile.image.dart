import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/controler/profile.image.controller.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';

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
  String urlValida = '';

  loadImages() async {
    setState(() {
      loading = true;
    });
    final uid = FirebaseAuth.instance.currentUser!.uid.toString();
    Reference ref = storage.ref().child('images/${uid}_200x200.jpg');
    final url = await ref.getDownloadURL();
    context.read<MyHouseBloc>().add(UpdateValueUserMyHouseEvent(
        'users', 'profileImage', await ref.getDownloadURL()));
    setState(() {
      urlValida = url;
    });
  }

  final FirebaseStorage storage = FirebaseStorage.instance;

  updateValueUser() async {
    context
        .read<MyHouseBloc>()
        .add(UpdateValueUserMyHouseEvent('users', 'profileImage', 'ref'));
    setState(() {});
  }

  late final controller = ProfileImageController(() {
    setState(() {});
  }, '', updateValueUser);

  @override
  Widget build(BuildContext context) {
    final loginbloc = context.watch<LoginBloc>();
    final loginstate = loginbloc.state;

    if (loginstate is CompleteFetchUserResidentLoginState) {
      setState(() {
        controller.url = loginstate.resident.profileImage!;
      });
      if (loginstate.resident.profileImage == 'ref') {
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
            if (loginstate is CompleteFetchUserResidentLoginState)
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
                              loginstate.resident.profileImage == 'ref'
                          ? const Padding(
                              padding: EdgeInsets.all(10),
                              child: CircularProgressIndicator(),
                            )
                          : Image(
                              image: NetworkImage(controller.url),
                              fit: BoxFit.cover),
                    ),
            const SizedBox(height: 15),
            Text('Nome ${widget.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kLightWhite,
                )),
            const SizedBox(height: 15),
            if (loginstate is CompleteFetchUserResidentLoginState)
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
                      loginstate.resident.profileImage != 'ref')
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
                                //     loginstate.Entity.profileImage);
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
