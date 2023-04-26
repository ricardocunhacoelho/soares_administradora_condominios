import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/domain/entity/called.entity.dart';
import 'package:soares_administradora_condominios/condominium/models/called.model.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

class CalledController {
  final VoidCallback refresh;
  ESectorDestiny? eSectorDestiny;
  String? message;
  final formKey = GlobalKey<FormState>();
  bool foul = false;
  bool loadingFinish = false;
  bool finish = false;

  final dropValue = ValueNotifier('');
  final dropAboutOptions = [
    'Encomendas',
    'Acesso de pessoa',
    'Aviso',
    'Denuncia',
    'Ajuda',
  ];

  CalledController(this.refresh);

  String? validateMessage(String? message) =>
      message!.isNotEmpty ? null : 'Digite uma mensagem.';

  bool validate({required GlobalKey<FormState> formKey}) {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  CalledModel generateCalled(
      String message, String about, ESectorDestiny sectorDestiny, String residentID, String unitId) {
    var called = CalledModel.empty();
    DateTime date = DateTime.now();
    called = called.copyWith(id: '${residentID}_$date');
    called = called.copyWith(about: about);
    called = called.copyWith(message: message);
    called = called.copyWith(residentId: residentID);
    called = called.copyWith(unitId: unitId);
    called = called.copyWith(sectorDestiny: sectorDestiny);
    called = called.copyWith(dateSend: date);
    return called;
  }
}
