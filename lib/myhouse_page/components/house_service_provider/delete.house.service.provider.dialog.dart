import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';

class DeleteHouseServiceProviderDialog extends StatefulWidget {
  final HouseServiceProviderEntity houseServiceProvider;
  final int index;
  final String idUnit;
  final Function finishDelete;
  const DeleteHouseServiceProviderDialog(
      {super.key,
      required this.idUnit,
      required this.houseServiceProvider,
      required this.index,
      required this.finishDelete});

  @override
  _DeleteHouseServiceProviderDialogState createState() => new _DeleteHouseServiceProviderDialogState();
}

class _DeleteHouseServiceProviderDialogState extends State<DeleteHouseServiceProviderDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Deseja remover este funcionário do acesso ao condomínio?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Não')),
        TextButton(
            onPressed: () {
              context.read<MyHouseBloc>().add(DeleteHouseServiceProviderMyHouseEvent(
                  widget.houseServiceProvider.cpf, widget.index, widget.idUnit));
              Navigator.pop(context);
              widget.finishDelete();
            },
            child: const Text('Sim')),
      ],
    );
  }
}
