import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/house_service_provider/add.image.picture.house.service.provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/house_service_provider/delete.house.service.provider.dialog.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class DetailsHouseServiceProviderDialog extends StatefulWidget {
  final HouseServiceProviderEntity houseServiceProvider;
  final int index;
  const DetailsHouseServiceProviderDialog(
      {super.key, required this.houseServiceProvider, required this.index});
  @override
  _DetailsHouseServiceProviderDialogState createState() =>
      new _DetailsHouseServiceProviderDialogState();
}

class _DetailsHouseServiceProviderDialogState
    extends State<DetailsHouseServiceProviderDialog> {
  List week = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'];

  String daysWeek(List days, List boolValues) {
    String daysWeekComplete = '';
    for (int i = 0; i < boolValues.length; i++) {
      boolValues[i] == true
          ? daysWeekComplete = daysWeekComplete == ''
              ? '$daysWeekComplete ${days[i]}'
              : '$daysWeekComplete, ${days[i]}'
          : null;
    }
    return '$daysWeekComplete.';
  }

  int indexCorrect = 0;
  String daysWork = '';

  finishDelete() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final myHouseBloc = context.watch<FetchUnitBloc>();
    final myHouseState = myHouseBloc.state;
    if (myHouseState is CompleteFetchHomeUnitFetchStates) {
      indexCorrect = myHouseState.homeUnitEntity.houseServiceProviders
          .indexWhere(
              (element) => element.cpf == widget.houseServiceProvider.cpf);

      if (!myHouseState
          .homeUnitEntity.houseServiceProviders[indexCorrect].freePass) {
        daysWork = daysWeek(
            week,
            myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect]
                .daysWeekAccess);
      }
    }

    return SingleChildScrollView(
      child: AlertDialog(
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
                                        return DeleteHouseServiceProviderDialog(
                                          idUnit:
                                              myHouseState.homeUnitEntity.id,
                                          houseServiceProvider: myHouseState
                                                  .homeUnitEntity
                                                  .houseServiceProviders[
                                              indexCorrect],
                                          index: indexCorrect,
                                          finishDelete: finishDelete,
                                        );
                                      });
                                },
                                icon: Icon(Icons.delete)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.edit)),
                          ],
                        )),
                    const SizedBox(height: 15),
                    if (myHouseState
                            .homeUnitEntity
                            .houseServiceProviders[indexCorrect]
                            .finishWorkDate !=
                        null)
                      Column(
                        children: [
                          Text(
                            'Acesso expira em: ${DateFormat('dd-MM-yyyy').format(myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].finishWorkDate!)}',
                            style: kPoppinsMedium.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                              color: kDarkBlue,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    Text(
                      'Nome completo: ${myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].name}',
                      style: kPoppinsMedium.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        color: kDarkBlue,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Telefone: ${myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].phoneNumber}',
                      style: kPoppinsMedium.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        color: kDarkBlue,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'CPF: ${myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].cpf}',
                      style: kPoppinsMedium.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        color: kDarkBlue,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Data de nascimento: ${myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].bornDate.day} / ${myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].bornDate.month} / ${myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].bornDate.year}',
                      style: kPoppinsMedium.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        color: kDarkBlue,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Acesso: ${myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].freePass ? 'Livre acesso' : 'De ${myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].workStartTimeDay!.hour.toString().padLeft(2, '0')}:${myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].workStartTimeDay!.minute.toString()}hrs às ${myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].endOfWorkTimeDay!.hour.toString().padLeft(2, '0')}:${myHouseState.homeUnitEntity.houseServiceProviders[indexCorrect].endOfWorkTimeDay!.minute.toString()}hrs'}',
                      style: kPoppinsMedium.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        color: kDarkBlue,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    if (!myHouseState.homeUnitEntity
                        .houseServiceProviders[indexCorrect].freePass)
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'Dias: $daysWork',
                            style: kPoppinsMedium.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                              color: kDarkBlue,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    if (myHouseState.homeUnitEntity
                            .houseServiceProviders[indexCorrect].picture ==
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
                                      return AddImagePictureHouseServiceProviderDialogComponente(
                                        index: widget.index,
                                        houseServiceProvider: myHouseState
                                                .homeUnitEntity
                                                .houseServiceProviders[
                                            indexCorrect],
                                      );
                                    });
                              },
                              icon: Icon(Icons.add_a_photo_rounded)),
                        ],
                      ),
                    if (myHouseState.homeUnitEntity
                                .houseServiceProviders[indexCorrect].picture !=
                            '' &&
                        myHouseState.homeUnitEntity
                                .houseServiceProviders[indexCorrect].picture !=
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
                                      myHouseState
                                          .homeUnitEntity
                                          .houseServiceProviders[indexCorrect]
                                          .picture!,
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
      ),
    );
  }
}
