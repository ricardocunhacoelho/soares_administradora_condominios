import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:soares_administradora_condominios/home_unit/infra/datasource/datasource.home.unit.dart';

class HomeUnitFirebase implements IHomeUnitDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  HomeUnitFirebase(this.firestore, this.firebaseAuth);


  @override
  Stream<Map<dynamic, dynamic>> fetchHomeUnit(String id) {
    final docRef = firestore.collection("home_units").doc(id);
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
