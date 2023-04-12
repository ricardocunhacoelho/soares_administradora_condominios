import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';

class DeleteVehicleDialog extends StatefulWidget {
  final VehicleEntity vehicle;
  final int index;
  final String idUnit;
  final Function finishDelete;
  const DeleteVehicleDialog(
      {super.key,
      required this.idUnit,
      required this.vehicle,
      required this.index,
      required this.finishDelete});

  @override
  _DeleteVehicleDialogState createState() => new _DeleteVehicleDialogState();
}

class _DeleteVehicleDialogState extends State<DeleteVehicleDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Deseja remover este veículo?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Não')),
        TextButton(
            onPressed: () {
              context.read<MyHouseBloc>().add(DeleteVehicleMyHouseEvent(
                  widget.idUnit, widget.vehicle, widget.index));
              Navigator.pop(context);
              widget.finishDelete();
            },
            child: const Text('Sim')),
      ],
    );
  }
}
