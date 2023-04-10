import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/visitors/add.image.picture.visitor.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/visitors/delete.visitor.dialog.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class DetailsVisitorDialog extends StatefulWidget {
  final VisitorEntity visitor;
  final int index;

  const DetailsVisitorDialog(
      {super.key, required this.visitor, required this.index});
  @override
  _DetailsVisitorDialogState createState() => new _DetailsVisitorDialogState();
}

class _DetailsVisitorDialogState extends State<DetailsVisitorDialog> {
  finishDelete() {
    Navigator.pop(context);
  }

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
      actionsPadding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: myHouseState is CompleteFetchHomeUnitFetchStates
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return DeleteVisitorDialog(
                                        idUnit: myHouseState.homeUnitEntity.id,
                                        visitor: myHouseState.homeUnitEntity
                                            .visitors[indexCorrect],
                                        index: indexCorrect,
                                        finishDelete: finishDelete,
                                      );
                                    });
                              },
                              icon: Icon(Icons.delete)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                        ],
                      )),
                  const SizedBox(height: 15),
                  Text(
                    'Acesso expira em: ${DateFormat('dd-MM-yyyy').format(myHouseState.homeUnitEntity.visitors[indexCorrect].finishaccessDate!)}',
                    style: kPoppinsMedium.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      color: kDarkBlue,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Nome completo: ${myHouseState.homeUnitEntity.visitors[indexCorrect].name}',
                    style: kPoppinsMedium.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      color: kDarkBlue,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Telefone: ${myHouseState.homeUnitEntity.visitors[indexCorrect].phoneNumber}',
                    style: kPoppinsMedium.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      color: kDarkBlue,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'CPF: ${myHouseState.homeUnitEntity.visitors[indexCorrect].cpf}',
                    style: kPoppinsMedium.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      color: kDarkBlue,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Data de nascimento: ${myHouseState.homeUnitEntity.visitors[indexCorrect].bornDate.day} / ${myHouseState.homeUnitEntity.visitors[indexCorrect].bornDate.month} / ${myHouseState.homeUnitEntity.visitors[indexCorrect].bornDate.year}',
                    style: kPoppinsMedium.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      color: kDarkBlue,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Acesso: ${myHouseState.homeUnitEntity.visitors[indexCorrect].freePass ? 'Livre acesso' : 'Diario das ${myHouseState.homeUnitEntity.visitors[indexCorrect].startTimeAccessDay!.hour.toString().padLeft(2, '0')}:${myHouseState.homeUnitEntity.visitors[indexCorrect].startTimeAccessDay!.minute.toString()}hrs Às ${myHouseState.homeUnitEntity.visitors[indexCorrect].endTimeAccessDay!.hour.toString().padLeft(2, '0')}:${myHouseState.homeUnitEntity.visitors[indexCorrect].endTimeAccessDay!.minute.toString()}hrs'}',
                    style: kPoppinsMedium.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      color: kDarkBlue,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  if (myHouseState
                          .homeUnitEntity.visitors[indexCorrect].picture ==
                      '')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Cadastre uma fato para facilitar a entrada na portaria: ',
                          style: kPoppinsMedium.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AddImagePictureVisitorDialogComponente(
                                      index: widget.index,
                                      visitor: myHouseState.homeUnitEntity
                                          .visitors[indexCorrect],
                                    );
                                  });
                            },
                            icon: Icon(Icons.add_a_photo_rounded)),
                      ],
                    ),
                  if (myHouseState
                              .homeUnitEntity.visitors[indexCorrect].picture !=
                          '' &&
                      myHouseState
                              .homeUnitEntity.visitors[indexCorrect].picture !=
                          'ref')
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    myHouseState.homeUnitEntity
                                        .visitors[indexCorrect].picture!,
                                  ),
                                  fit: BoxFit.cover),
                            )),
                      ],
                    ),
                ],
              )
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
      actions: [
        Container(
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: kGrey,
          ),
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Voltar',
                  style: kPoppinsSemiBold.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    color: kLightWhite,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
