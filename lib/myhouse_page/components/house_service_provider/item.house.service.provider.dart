import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/house_service_provider/details.house.service.provider.dialog.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/models/house.service.provider.model.dart';

class ItemHouseServiceProvider extends StatefulWidget {
  final HouseServiceProviderEntity houseServiceProviderEntity;
  final int index;
  const ItemHouseServiceProvider(
      {super.key,
      required this.houseServiceProviderEntity,
      required this.index});

  @override
  State<ItemHouseServiceProvider> createState() =>
      _ItemHouseServiceProviderState();
}

class _ItemHouseServiceProviderState extends State<ItemHouseServiceProvider> {
  FirebaseStorage storage = FirebaseStorage.instance;
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

  loadImages() async {
    HouseServiceProviderModel houseServiceProviderModel = HouseServiceProviderModel.converter(widget.houseServiceProviderEntity);
    Reference ref =
        storage.ref().child('images/${widget.houseServiceProviderEntity.cpf}_200x200.jpg');
    final url = await ref.getDownloadURL();
    houseServiceProviderModel = houseServiceProviderModel.copyWith(picture: url);
    context
        .read<MyHouseBloc>()
        .add(UpdateValueHouseServiceProviderEvent(houseServiceProviderModel, widget.index));
  }

  String daysWork = '';

  @override
  Widget build(BuildContext context) {
    if (!widget.houseServiceProviderEntity.freePass) {
      daysWork =
          daysWeek(week, widget.houseServiceProviderEntity.daysWeekAccess);
    }
    if (widget.houseServiceProviderEntity.picture == 'ref') {
      loadImages();
    }
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return DetailsHouseServiceProviderDialog(
                  houseServiceProvider: widget.houseServiceProviderEntity,
                  index: widget.index);
            });
      },
      horizontalTitleGap: 18,
      contentPadding:
          const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
      trailing: Container(
          width: 60,
          alignment: Alignment.centerRight,
          child: const Icon(
            Icons.person,
            color: Colors.greenAccent,
            size: 20,
          )),
      title: Text(
        widget.houseServiceProviderEntity.name,
        style: const TextStyle(fontSize: 13),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tel. ${widget.houseServiceProviderEntity.phoneNumber}',
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            'Acesso: ${widget.houseServiceProviderEntity.freePass ? 'Livre acesso' : 'De ${widget.houseServiceProviderEntity.workStartTimeDay!.hour.toString().padLeft(2, '0')}:${widget.houseServiceProviderEntity.workStartTimeDay!.minute.toString()}hrs Às ${widget.houseServiceProviderEntity.endOfWorkTimeDay!.hour.toString().padLeft(2, '0')}:${widget.houseServiceProviderEntity.endOfWorkTimeDay!.minute.toString()}hrs'}',
            style: const TextStyle(fontSize: 13),
          ),
          if (!widget.houseServiceProviderEntity.freePass)
            Text(
              'Dias: $daysWork',
              style: const TextStyle(fontSize: 13),
            ),
        ],
      ),
    );
  }
}
