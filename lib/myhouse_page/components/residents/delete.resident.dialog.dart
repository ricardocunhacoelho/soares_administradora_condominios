
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

class DeleteResidentDialog extends StatefulWidget {
  final ResidentEntity residentEntity;
  final int index;
  DeleteResidentDialog(this.index, this.residentEntity);

  @override
  _DeleteResidentDialogState createState() =>
      new _DeleteResidentDialogState();
}

class _DeleteResidentDialogState
    extends State<DeleteResidentDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Deseja mesmo remover este morador?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Não')),
        TextButton(
            onPressed: () {
              context
                  .read<MyHouseBloc>()
                  .add(DeleteResidentMyHouseEvent(widget.residentEntity.cpf, widget.index));
              Navigator.pop(context);
            },
            child: Text('Sim')),
      ],
    );
  }
}
