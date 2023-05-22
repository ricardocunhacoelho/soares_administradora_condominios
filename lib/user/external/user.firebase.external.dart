import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:soares_administradora_condominios/login/auth.result.dart';
import 'package:soares_administradora_condominios/user/domain/valueobjects/result.upload.image.value.object.dart';
import 'package:soares_administradora_condominios/user/infra/datasource/datasource.user.dart';

class UserFirebase implements IUserDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;
  UserFirebase(this.firebaseFirestore, this.firebaseAuth, this.firebaseStorage);

  @override
  Future<AuthResult> authenticateUser(String email, String pass) async {
    try {
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      if (result.user != null) {
        return AuthResult();
      } else {
        return AuthResult(msgError: 'Não autenticado, tente novamente');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-not-found') {
        return AuthResult(
            msgError: 'Nenhum usuário encontrado para esse e-mail.');
      } else if (e.code == 'wrong-password') {
        return AuthResult(
            msgError: 'A Senha fornecida está incorreta para esse e-mail.');
      } else {
        return AuthResult(msgError: 'Email ou senha inválidos');
      }
    }
  }

  @override
  Stream<Map<dynamic, dynamic>> fetchUser(String uid) {
    final docRef = firebaseFirestore.collection("users").doc(uid);
    final snapshots = docRef.snapshots();
    return snapshots.map(_convert);
  }

  Map<dynamic, dynamic> _convert(DocumentSnapshot<Map<String, dynamic>> doc) {
     var ex = {
      'id': doc.id,
      ...doc.data()!,
    };
    print(ex);
    return ex;
  }

  @override
  Future<ResultUploadImageValueObject> addProfileImageUser(String path) async {
    UploadTask task = await uploadImage(path);
    return ResultUploadImageValueObject(msgError: null, task: task);
  }

  Future<UploadTask> uploadImage(String path) async {
    final uid = firebaseAuth.currentUser!.uid;
    File file = File(path);
    try {
      String ref = 'images/$uid.jpg';
      return firebaseStorage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  @override
  Future<void> updateValueUser(String library, String key,data) async {
    final uid = firebaseAuth.currentUser!.uid;
    var ref = firebaseFirestore.collection(library).doc(uid);
    await ref.update({key: data});
  }

  @override
  Future<void> deleteProfileImageUser() async {
    final uid = firebaseAuth.currentUser!.uid;
    await firebaseStorage.ref('images/profile/$uid.jpg').delete();
    await firebaseStorage.ref('images/profile/thumb_$uid.jpg').delete();
  }
}
