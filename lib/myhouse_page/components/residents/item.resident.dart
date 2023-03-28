import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/residents/delete.resident.dialog.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/models/myhouse.model.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import '../../../app.style.dart';

class ItemResident extends StatefulWidget {
  final ResidentEntity residentEntity;
  final int index;
  const ItemResident(
      {super.key, required this.residentEntity, required this.index});

  @override
  State<ItemResident> createState() => _ItemResidentState();
}

class _ItemResidentState extends State<ItemResident> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  bool loading = false;

  loadImages() async {
    setState(() {
      loading = true;
    });
    MyHouseResidentModel myHouseResidentModel =
        MyHouseResidentModel.converter(widget.residentEntity);
    Reference ref =
        storage.ref().child('images/${widget.residentEntity.cpf}_60x60.jpg');
    final url = await ref.getDownloadURL();
    myHouseResidentModel = myHouseResidentModel.copyWith(picture: url);
    print('valor no model ${myHouseResidentModel.picture}');
    context.read<MyHouseBloc>().add(UpdateValueResidentMyHouseEvent(
        myHouseResidentModel, widget.index));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.residentEntity.picture == 'ref') {
      loadImages();
      setState(() {
        loading = false;
      });
    }
    return ListTile(
      horizontalTitleGap: 18,
      contentPadding:
          const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
      trailing: Container(
        width: 150,
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 17,
              onPressed: () {
                // showDialog(
                //     context: context,
                //     builder: (_) {
                //       return DetalhesProdutoDialogComponente(produto);
                //     });
              },
              icon: const Icon(
                Icons.description_sharp,
              ),
            ),
            IconButton(
              iconSize: 17,
              onPressed: () {
                // showDialog(
                //     context: context,
                //     builder: (_) {
                //       return EditarProdutoDialogComponente(produto);
                //     });
              },
              icon: const Icon(
                Icons.edit,
              ),
            ),
            IconButton(
              iconSize: 17,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return DeleteResidentDialog(widget.index,widget.residentEntity);
                    });
              },
              icon: const Icon(
                Icons.delete,
              ),
            ),
          ],
        ),
      ),
      leading: widget.residentEntity.picture == ''
          ? Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                color: kGrey,
              ),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.add_a_photo)))
          : widget.residentEntity.picture == 'ref'
              ? Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kGrey,
                  ),
                  child: const Center(
                      child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  )))
              : Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kWhite,
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.residentEntity.picture,
                        ),
                        fit: BoxFit.cover),
                  )),
      title: Text(
        widget.residentEntity.name,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}
