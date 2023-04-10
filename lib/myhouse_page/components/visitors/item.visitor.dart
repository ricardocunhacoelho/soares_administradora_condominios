import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/visitors/details.visitor.dialog.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/models/visitor.model.dart';

import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';

class ItemVisitor extends StatefulWidget {
  final VisitorEntity visitorEntity;
  final int index;
  const ItemVisitor(
      {super.key, required this.visitorEntity, required this.index});

  @override
  State<ItemVisitor> createState() => _ItemVisitorState();
}

class _ItemVisitorState extends State<ItemVisitor> {
  FirebaseStorage storage = FirebaseStorage.instance;
  loadImages() async {
    VisitorModel visitorModel = VisitorModel.converter(widget.visitorEntity);
    Reference ref =
        storage.ref().child('images/${widget.visitorEntity.cpf}_200x200.jpg');
    final url = await ref.getDownloadURL();
    visitorModel = visitorModel.copyWith(picture: url);
    context
        .read<MyHouseBloc>()
        .add(UpdateValueVisitorEvent(visitorModel, widget.index));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.visitorEntity.picture == 'ref') {
      loadImages();
    }
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return DetailsVisitorDialog(
                visitor: widget.visitorEntity,
                index: widget.index,
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
            Icons.person,
            color: Colors.greenAccent,
            size: 20,
          )),
      title: Text(
        widget.visitorEntity.name,
        style: const TextStyle(fontSize: 13),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tel. ${widget.visitorEntity.phoneNumber}',
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            'Acesso: ${widget.visitorEntity.freePass ? 'Livre acesso' : 'Diario das ${widget.visitorEntity.startTimeAccessDay!.hour.toString().padLeft(2, '0')}:${widget.visitorEntity.startTimeAccessDay!.minute.toString()}hrs Às ${widget.visitorEntity.endTimeAccessDay!.hour.toString().padLeft(2, '0')}:${widget.visitorEntity.endTimeAccessDay!.minute.toString()}hrs'}',
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
