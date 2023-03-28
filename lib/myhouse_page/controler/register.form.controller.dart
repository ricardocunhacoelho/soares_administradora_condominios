import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/myhouse_page/models/myhouse.model.dart';

class RegisterFormController {
  final VoidCallback refresh;
  final formKey = GlobalKey<FormState>();
  final FirebaseStorage storage = FirebaseStorage.instance;
  String? name;
  String? email;
  String? cpf;
  String? phone;
  String? borndate;
  File? image;
  bool uploadingImage = false;
  double totalProgressUploadImage = 0;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  RegisterFormController(this.refresh);

  String? validateName(String? name) =>
      name!.isNotEmpty ? null : 'Nome Inválido';

  String? validateEmail(String? email) =>
      email!.isNotEmpty ? null : 'Email inválido';

  String? validatePhone(String? phone) =>
      phone!.isNotEmpty ? null : 'Phone inválido';

  String? validateCpf(String? cpf) => cpf!.isNotEmpty ? null : 'Cpf inválido';

  String? validateBornDate(String? bornDate) =>
      bornDate!.isNotEmpty ? null : 'Inválido Data';

  bool validate({required GlobalKey<FormState> formKey}) {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  MyHouseResidentModel generateResidentForm(HomeUnitEntity homeUnitEntity) {
    var resident = MyHouseResidentModel.empty();
    DateTime date = generateDateForm(borndate!);
    String cpfUnmasked = generateCpfForm(cpf!);
    resident = resident.copyWith(bornDate: date);
    resident = resident.copyWith(name: name);
    resident = resident.copyWith(email: email);
    resident = resident.copyWith(cpf: cpfUnmasked);
    resident = resident.copyWith(phoneNumber: phone);
    resident = resident.copyWith(id: '${homeUnitEntity.id}_${cpfUnmasked}');
    resident = resident.copyWith(unit: homeUnitEntity.unit);
    resident = resident.copyWith(picture: image != null ? 'ref' : '');
    return resident;
  }

  DateTime generateDateForm(String date) {
    List<String> list = date.split('/');

    int? year = int.tryParse(list[2]);
    int? month = int.tryParse(list[1]);
    int? day = int.tryParse(list[0]);
    return DateTime(year!, month!, day!);
  }

  String generateCpfForm(String cpf) {
    return cpf.replaceAll(RegExp(r'[.,-]'), "");
  }

  Future<void> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? imagePicked = await _picker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      image = File(imagePicked.path);
      refresh();
    }
  }

  Future<UploadTask> uploadPic(File? imageFile) async {
    try {
      String cpfUnmasked = generateCpfForm(cpf!);
      return storage.ref('images/$cpfUnmasked.jpg').putFile(imageFile!);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

    finalizeUpload() async {
    if (image != null) {
      UploadTask task = await uploadPic(image);
      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          uploadingImage = true;
          totalProgressUploadImage = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          refresh();
        } else if (snapshot.state == TaskState.success) {
          refresh();
          uploadingImage = false;
          refresh();
        }
      });
    } else {
      print('erro ao pegar caminho da imagem');
    }
  }
}
