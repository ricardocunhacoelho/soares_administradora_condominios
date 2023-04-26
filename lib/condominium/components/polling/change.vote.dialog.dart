import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/entity/polling.entity.dart';
import 'package:soares_administradora_condominios/condominium/bloc/polling.bloc.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class ChangeVoteDialog extends StatefulWidget {
  final PollingEntity polling;
  final int vote;
  final VoidCallback changeVote;

  const ChangeVoteDialog({
    super.key,
    required this.polling,
    required this.vote,
    required this.changeVote,
  });

  @override
  _ChangeVoteDialogState createState() => new _ChangeVoteDialogState();
}

class _ChangeVoteDialogState extends State<ChangeVoteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.polling.text,
              style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kDarkBlue)),
          const SizedBox(height: 12),
          Text('Você votou ${widget.vote == 1 ? '\'SIM\'' : '\'NÃO\''}',
              style: kPoppinsRegular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: kDarkBlue)),
          const SizedBox(height: 12),
          Text('Deseja alterar seu voto?',style: kPoppinsSemiBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: kDarkBlue)),
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Não')),
        TextButton(
            onPressed: () {
              widget.changeVote();
              Navigator.pop(context);
            },
            child: const Text('Sim')),
      ],
    );
  }
}
