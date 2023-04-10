import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/myhouse_page/models/visitor.model.dart';

class VisitorControllerRegister {
  final VoidCallback refresh;
  final Function register;
  final formKey = GlobalKey<FormState>();
  final FirebaseStorage storage = FirebaseStorage.instance;
  String? name;
  String? cpf;
  String? phone;
  String? borndate;
  File? image;
  bool uploadingImage = false;
  bool loadingFinish = false;
  bool finish = false;
  double totalProgressUploadImage = 0;
  bool freePass = false;
  TimeOfDay? endTimeAccessDay;
  DateTime? finishaccessDate;
  TimeOfDay? startTimeAccessDay;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  VisitorControllerRegister(this.refresh, this.register);

  changeFreepass(bool value) {
    freePass = value;
    refresh();
  }

  String? validateName(String? name) =>
      name!.isNotEmpty ? null : 'Nome Inválido';

  String? validateEmail(String? email) =>
      email!.isNotEmpty ? null : 'Email inválido';

  String? validatePhone(String? phone) =>
      phone!.isNotEmpty && phone.length == 16 ? null : 'Phone inválido';

  String? validateCpf(String? cpf) =>
      cpf!.isNotEmpty && cpf.length == 14 ? null : 'Cpf inválido';

  String? validateBornDate(String? bornDate) =>
      checkDateForm(bornDate!) == true &&
              bornDate.isNotEmpty &&
              bornDate.length == 10
          ? null
          : 'Está data é inválida';

  bool validate({required GlobalKey<FormState> formKey}) {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  VisitorModel generateVisitorForm(HomeUnitEntity homeUnitEntity, String? ulr) {
    var visitor = VisitorModel.empty();
    DateTime date = generateDateForm(borndate!);
    String cpfUnmasked = generateCpfForm(cpf!);
    visitor = visitor.copyWith(id: '${homeUnitEntity.id}_${cpfUnmasked}');
    visitor = visitor.copyWith(name: name);
    visitor = visitor.copyWith(bornDate: date);
    visitor = visitor.copyWith(cpf: cpfUnmasked);
    visitor = visitor.copyWith(phoneNumber: phone);
    visitor = visitor.copyWith(picture: ulr);
    visitor = visitor.copyWith(unit: homeUnitEntity.unit);
    visitor = visitor.copyWith(access: freePass);
    visitor = visitor.copyWith(startaccessDate: DateTime.now());
    visitor = visitor.copyWith(startTimeAccessDay: startTimeAccessDay);
    visitor = visitor.copyWith(endTimeAccessDay: endTimeAccessDay);
    visitor = visitor.copyWith(finishaccessDate: finishaccessDate);
    return visitor;
  }

  DateTime generateDateForm(String date) {
    List<String> list = date.split('/');

    int? year = int.tryParse(list[2]);
    int? month = int.tryParse(list[1]);
    int? day = int.tryParse(list[0]);
    return DateTime(year!, month!, day!);
  }

  static DateTime lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? new DateTime(month.year, month.month + 1, 1)
        : new DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(new Duration(days: 1));
  }

  bool checkDateForm(String date) {
    List<String> list = date.split('/');
    final now = DateTime.now();
    int? year = int.tryParse(list[2]);
    int? month = int.tryParse(list[1]);
    int? day = int.tryParse(list[0]);
    if (year! > now.year) {
      return false;
    } else if (year < (now.year - 100)) {
      return false;
    } else if (month! > 12) {
      return false;
    } else if (day! > 31) {
      return false;
    } else if (month == 01 && day > lastDayOfMonth(DateTime(2023, 1)).day) {
      return false;
    } else if (month == 02 && day > lastDayOfMonth(DateTime(2023, 2)).day) {
      return false;
    } else if (month == 03 && day > lastDayOfMonth(DateTime(2023, 3)).day) {
      return false;
    } else if (month == 04 && day > lastDayOfMonth(DateTime(2023, 4)).day) {
      return false;
    } else if (month == 05 && day > lastDayOfMonth(DateTime(2023, 5)).day) {
      return false;
    } else if (month == 05 && day > lastDayOfMonth(DateTime(2023, 5)).day) {
      return false;
    } else if (month == 06 && day > lastDayOfMonth(DateTime(2023, 6)).day) {
      return false;
    } else if (month == 07 && day > lastDayOfMonth(DateTime(2023, 7)).day) {
      return false;
    } else if (month == 08 && day > lastDayOfMonth(DateTime(2023, 8)).day) {
      return false;
    } else if (month == 09 && day > lastDayOfMonth(DateTime(2023, 9)).day) {
      return false;
    } else if (month == 10 && day > lastDayOfMonth(DateTime(2023, 10)).day) {
      return false;
    } else if (month == 11 && day > lastDayOfMonth(DateTime(2023, 11)).day) {
      return false;
    } else if (month == 12 && day > lastDayOfMonth(DateTime(2023, 12)).day) {
      return false;
    } else if (month == 00) {
      return false;
    } else if (day == 00) {
      return false;
    } else if (year == 00) {
      return false;
    } else {
      return true;
    }
  }

  String generateCpfForm(String cpf) {
    return cpf.replaceAll(RegExp(r'[.,-]'), "");
  }

  Future<void> getImageGallery() async {
    final ImagePicker _picker = ImagePicker();
    XFile? imagePicked = await _picker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      image = File(imagePicked.path);
      refresh();
    }
  }

  Future<void> getImageCamera() async {
    final ImagePicker _picker = ImagePicker();
    XFile? imagePicked = await _picker.pickImage(source: ImageSource.camera);
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

  finalizeUpload(HomeUnitEntity homeUnitEntity) async {
    if (image != null) {
      UploadTask task = await uploadPic(image);
      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          uploadingImage = true;
          totalProgressUploadImage =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          refresh();
        } else if (snapshot.state == TaskState.success) {
          final ref = snapshot.ref;
          final url = await ref.getDownloadURL();
          var visitor = generateVisitorForm(homeUnitEntity, url);
          await register(visitor);
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
