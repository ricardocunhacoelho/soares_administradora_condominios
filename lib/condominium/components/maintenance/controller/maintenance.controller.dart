import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/condominium/models/maintenance.model.dart';

class MaintenanceController {
  final VoidCallback refresh;
  final Function register;
  final formKey = GlobalKey<FormState>();
  final FirebaseStorage storage = FirebaseStorage.instance;
  String? observation;
  String? local;
  File? image;
  bool uploadingImage = false;
  bool loadingFinish = false;
  bool finish = false;
  double totalProgressUploadImage = 0;
  bool foul = false;
  DateTime day = DateTime.now();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  MaintenanceController(this.refresh, this.register);

  String? validateObservation(String? observation) =>
      observation!.isNotEmpty ? null : 'Digite uma observação';

  String? validateLocal(String? local) =>
      local!.isNotEmpty ? null : 'Informe o local';

  bool validate({required GlobalKey<FormState> formKey}) {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  MaintenanceModel generateMaintenanceForm(
      String observation, String residentId, String unitId, String urlImage) {
    var maintenance = MaintenanceModel.empty();
    DateTime date = DateTime.now();
    maintenance = maintenance.copyWith(id: '${residentId}_$date');
    maintenance = maintenance.copyWith(observation: observation);
    maintenance = maintenance.copyWith(residentId: residentId);
    maintenance = maintenance.copyWith(unitId: unitId);
    maintenance = maintenance.copyWith(dateSend: date);
    maintenance = maintenance.copyWith(image: urlImage);
    return maintenance;
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

  Future<UploadTask> uploadPic(File? imageFile, String maintenanceId) async {
    try {
      return storage.ref('images/$maintenanceId.jpg').putFile(imageFile!);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  finalizeUpload(String observation, String residentId, String unitId) async {
    if (image != null) {
      UploadTask task = await uploadPic(image, '${residentId}_$day');
      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          uploadingImage = true;
          totalProgressUploadImage =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          refresh();
        } else if (snapshot.state == TaskState.success) {
          final ref = snapshot.ref;
          final url = await ref.getDownloadURL();
          var maintenance =
              generateMaintenanceForm(observation, residentId, unitId, url);
          await register(maintenance);
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
