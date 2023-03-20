import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/home_unit/infra/adapters/json.to.from.home.unit.adapter.dart';

import 'package:soares_administradora_condominios/home_unit/infra/datasource/datasource.home.unit.dart';
import 'package:soares_administradora_condominios/login/auth.result.dart';

class HomeUnitFirebase implements IHomeUnitDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  HomeUnitFirebase(this.firestore, this.firebaseAuth);

  @override
  Future<AuthResult> authenticateHomeUnit(String email, String pass) async {
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      if (result.user != null) {
        return AuthResult();
      } else {
        return AuthResult(msgError: 'Não autenticado, tente novamente');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-not-found') {
        return AuthResult(msgError: 'Nenhum usuário encontrado para esse e-mail.');
      } else if (e.code == 'wrong-password') {
        return AuthResult(msgError: 'A Senha fornecida está incorreta para esse e-mail.');
      }else{
        return AuthResult(msgError: 'Email ou senha inválidos');
      }
    }
  }

  @override
  Stream<Map<dynamic, dynamic>> fetchHomeUnit(String uid) {
    final docRef = firestore.collection("home_units").doc(uid);
    final snapshots = docRef.snapshots();
    return snapshots.map(_convert);
  }

  Map<dynamic, dynamic> _convert(DocumentSnapshot<Map<String, dynamic>> doc) {
    return {
      'id': doc.id,
      ...doc.data()!,
    };
  }
}
