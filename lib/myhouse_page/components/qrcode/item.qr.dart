import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/qrcode/for.share.dialog.qr.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/residents/details.resident.dialog.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/models/myhouse.model.dart';
import 'package:soares_administradora_condominios/person/person.object.dart';

import '../../../app.style.dart';

class ItemQr extends StatefulWidget {
  final PersonObject person;
  final int index;
  const ItemQr({super.key, required this.person, required this.index});

  @override
  State<ItemQr> createState() => _ItemQrState();
}

class _ItemQrState extends State<ItemQr> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return ForShareQrDialog(
                person: widget.person,
              );
            });
      },
      horizontalTitleGap: 18,
      contentPadding:
          const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
      trailing: Container(
        width: 60,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.share_rounded,
          size: 17,
        ),
      ),
      leading: QrImage(data: widget.person.qrData),
      title: Text(
        widget.person.name,
        style: const TextStyle(fontSize: 13),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tel. ${widget.person.phoneNumber}',
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            '${widget.person.ePersonType == EPersonType.morador ? 'Morador(a)' : widget.person.ePersonType == EPersonType.funcionario ? 'Funcionário(a)' : 'Visitante'}',
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
