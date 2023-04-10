import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/controler/house.service.provider.add.picturue.controller.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/models/house.service.provider.model.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class AddImagePictureHouseServiceProviderDialogComponente extends StatefulWidget {
  final HouseServiceProviderEntity houseServiceProvider;
  final int index;

  const AddImagePictureHouseServiceProviderDialogComponente(
      {super.key, required this.houseServiceProvider, required this.index});
  @override
  _AddImagePictureHouseServiceProviderDialogComponenteState createState() =>
      new _AddImagePictureHouseServiceProviderDialogComponenteState();
}

class _AddImagePictureHouseServiceProviderDialogComponenteState
    extends State<AddImagePictureHouseServiceProviderDialogComponente> {
  bool loading = false;
  String urlValida = '';

  loadImages() async {
    setState(() {
      loading = true;
    });
    HouseServiceProviderModel houseServiceProvider = HouseServiceProviderModel.converter(widget.houseServiceProvider);
    Reference ref = storage.ref().child('images/${widget.houseServiceProvider.cpf}_200x200.jpg');
    final url = await ref.getDownloadURL();
    houseServiceProvider = houseServiceProvider.copyWith(picture: url);
    context
        .read<MyHouseBloc>()
        .add(UpdateValueHouseServiceProviderEvent(houseServiceProvider, widget.index));
    setState(() {
      urlValida = url;
    });
  }

  final FirebaseStorage storage = FirebaseStorage.instance;

  updateValueUser() async {
    HouseServiceProviderModel houseServiceProvider = HouseServiceProviderModel.converter(widget.houseServiceProvider);
    houseServiceProvider = houseServiceProvider.copyWith(picture: 'ref');

    context
        .read<MyHouseBloc>()
        .add(UpdateValueHouseServiceProviderEvent(houseServiceProvider, widget.index));
    setState(() {});
  }

  late final controller = AddPictureHouseServiceProviderController(() {
    setState(() {});
  }, updateValueUser);

  int indexCorrect = 0;
  @override
  Widget build(BuildContext context) {
    final myHouseBloc = context.watch<FetchUnitBloc>();
    final myHouseState = myHouseBloc.state;
    if (myHouseState is CompleteFetchHomeUnitFetchStates) {
      indexCorrect = myHouseState.homeUnitEntity.houseServiceProviders
          .indexWhere((element) => element.cpf == widget.houseServiceProvider.cpf);
    }
    return AlertDialog(
      backgroundColor: kLightGrey,
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: myHouseState is CompleteFetchHomeUnitFetchStates ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].picture == ''
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
                                      .pickAndUploadImage(myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].cpf);
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
                            myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].picture == 'ref'
                        ? const Padding(
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator(),
                          )
                        : Image(
                            image: NetworkImage(myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].picture!),
                            fit: BoxFit.cover),
                  ),
            const SizedBox(height: 15),
            Text('Nome ${myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].name}',
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
                              controller.pickAndUploadImage(myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].cpf);
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
                if (myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].picture != '' &&
                    myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].picture != 'ref')
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
