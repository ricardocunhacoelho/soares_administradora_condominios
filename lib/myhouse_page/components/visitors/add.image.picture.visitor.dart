import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/controler/add.picture.visitor.controller.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/models/visitor.model.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class AddImagePictureVisitorDialogComponente extends StatefulWidget {
  final VisitorEntity visitor;
  final int index;

  const AddImagePictureVisitorDialogComponente(
      {super.key, required this.visitor, required this.index});
  @override
  _AddImagePictureVisitorDialogComponenteState createState() =>
      new _AddImagePictureVisitorDialogComponenteState();
}

class _AddImagePictureVisitorDialogComponenteState
    extends State<AddImagePictureVisitorDialogComponente> {
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = false;
  String urlValida = '';

  loadImages() async {
    setState(() {
      loading = true;
    });
    VisitorModel visitor = VisitorModel.converter(widget.visitor);
    Reference ref = storage.ref().child('images/${visitor.cpf}_200x200.jpg');
    final url = await ref.getDownloadURL();
    visitor = visitor.copyWith(picture: url);
    context
        .read<MyHouseBloc>()
        .add(UpdateValueVisitorEvent(visitor, widget.index));
    setState(() {
      urlValida = url;
    });
  }

  final FirebaseStorage storage = FirebaseStorage.instance;

  updateValueUser() async {
    VisitorModel visitor = VisitorModel.converter(widget.visitor);
    visitor = visitor.copyWith(picture: 'ref');

    context
        .read<MyHouseBloc>()
        .add(UpdateValueVisitorEvent(visitor, widget.index));
    setState(() {});
  }

  late final controller = ProfilePictureVisitorController(() {
    setState(() {});
  }, updateValueUser);

  int indexCorrect = 0;
  @override
  Widget build(BuildContext context) {
    final myHouseBloc = context.watch<FetchUnitBloc>();
    final myHouseState = myHouseBloc.state;
    if (myHouseState is CompleteFetchHomeUnitFetchStates) {
      indexCorrect = myHouseState.homeUnitEntity.visitors
          .indexWhere((element) => element.cpf == widget.visitor.cpf);
    }
    return AlertDialog(
      backgroundColor: kLightGrey,
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: myHouseState is CompleteFetchHomeUnitFetchStates ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            myHouseState.homeUnitEntity.visitors[indexCorrect].picture == ''
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
                                  controller
                                      .pickAndUploadImage(myHouseState.homeUnitEntity.visitors[indexCorrect].cpf);
                                })
                            : Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        'Carregando ${controller.total.round()}%',
                                        style: kPoppinsBold.copyWith(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
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
                            myHouseState.homeUnitEntity.visitors[indexCorrect].picture == 'ref'
                        ? const Padding(
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator(),
                          )
                        : Image(
                            image: NetworkImage(myHouseState.homeUnitEntity.visitors[indexCorrect].picture!),
                            fit: BoxFit.cover),
                  ),
            const SizedBox(height: 15),
            Text('Nome ${myHouseState.homeUnitEntity.visitors[indexCorrect].name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kLightWhite,
                )),
            const SizedBox(height: 15),
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
                              controller.pickAndUploadImage(myHouseState.homeUnitEntity.visitors[indexCorrect].cpf);
                            },
                      child: controller.uploading
                          ? const Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : Text('Escolher foto',
                              style: kPoppinsBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3,
                                color: kBlue,
                              ))),
                ),
                if (myHouseState.homeUnitEntity.visitors[indexCorrect].picture != '' &&
                    myHouseState.homeUnitEntity.visitors[indexCorrect].picture != 'ref')
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
        ) : Container(child: Center(child: CircularProgressIndicator(),),),
      ),
    );
  }
}
