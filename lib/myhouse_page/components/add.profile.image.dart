import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/fetch.user.login.bloc.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/events/login.events.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/controler/profile.image.controller.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class AddProfileImageDialogComponente extends StatefulWidget {
  final VoidCallback attImage1;
  final String name;

  const AddProfileImageDialogComponente({super.key, required this.name, required this.attImage1});
  @override
  _AddProfileImageDialogComponenteState createState() =>
      new _AddProfileImageDialogComponenteState();
}

class _AddProfileImageDialogComponenteState
    extends State<AddProfileImageDialogComponente> {

  int _imageVersion = 1;

  Future<void> _refreshImage() async {
    //call API & update the image
    _imageVersion++;
    setState(() {});
    widget.attImage1();
     context
          .read<LoginBloc>()
          .add(ChangeProfileImageEvent());
  }

  late final controller = ProfileImageController(() {
    setState(() {});
  }, '',_refreshImage);

  @override
  Widget build(BuildContext context) {
    final fetchUserBloc = context.watch<FetchUserBloc>();
    final fetchUserState = fetchUserBloc.state;
    if (fetchUserState is CompleteFetchUserResidentLoginState){
      _refreshImage();
    }
    return AlertDialog(
      backgroundColor: kLightGrey,
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (fetchUserState is CompleteFetchUserResidentLoginState)
              fetchUserState.resident.profileImageThumb == ''
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
                      child: controller.uploading
                          ? const Padding(
                              padding: EdgeInsets.all(10),
                              child: CircularProgressIndicator(),
                            )
                          : Image(
                              image: NetworkImage(fetchUserState
                                          .resident.profileImageThumb! +
                                      '#' +
                                      _imageVersion.toString()),
                              fit: BoxFit.cover),
                    ),
            const SizedBox(height: 15),
            if (fetchUserState is CompleteFetchUserResidentLoginState)
            Text('Nome ${fetchUserState.resident.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kLightWhite,
                )),
            const SizedBox(height: 15),
            if (fetchUserState is CompleteFetchUserResidentLoginState)
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
                  if (fetchUserState.resident.profileImageThumb! != '')
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
