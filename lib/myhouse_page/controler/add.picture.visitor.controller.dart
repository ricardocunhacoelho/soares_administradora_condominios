import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureVisitorController {
  final FirebaseStorage storage = FirebaseStorage.instance;
  bool uploading = false;
  double total = 0;
  final VoidCallback refresh;
  String url = '';
  String ref = '';
  final Function updateValueUser;

  ProfilePictureVisitorController(this.refresh, this.updateValueUser);

  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<UploadTask> upload(String path, String cpf) async {
    File file = File(path);
    try {
      ref = 'images/${cpf}.jpg';
      return storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  pickAndUploadImage(String cpf) async {
    XFile? file = await getImage();
    if (file != null) {
      UploadTask task = await upload(file.path, cpf);
      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          uploading = true;
          total = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          refresh();
        } else if (snapshot.state == TaskState.success) {
          refresh();
        }
      });
      await Future.delayed(Duration(seconds: 5));
      await updateValueUser();
      uploading = false;
      refresh();
    } else {
      print('erro ao pegar caminho da imagem');
    }
  }

  deleteImage(String ref) async {
    await storage.ref(ref).delete();
    refresh();
  }
}
