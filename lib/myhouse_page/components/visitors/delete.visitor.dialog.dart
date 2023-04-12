import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';

class DeleteVisitorDialog extends StatefulWidget {
  final VisitorEntity visitor;
  final int index;
  final String idUnit;
  final Function finishDelete;
  const DeleteVisitorDialog(
      {super.key,
      required this.idUnit,
      required this.visitor,
      required this.index,
      required this.finishDelete});

  @override
  _DeleteVisitorDialogState createState() => new _DeleteVisitorDialogState();
}

class _DeleteVisitorDialogState extends State<DeleteVisitorDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Deseja remover este visitante do acesso ao condomínio?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Não')),
        TextButton(
            onPressed: () {
              context.read<MyHouseBloc>().add(DeleteVisistorMyHouseEvent(
                  widget.visitor.cpf, widget.index, widget.idUnit));
              Navigator.pop(context);
              widget.finishDelete();
            },
            child: const Text('Sim')),
      ],
    );
  }
}
