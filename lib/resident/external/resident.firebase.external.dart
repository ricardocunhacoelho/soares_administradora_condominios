import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import 'package:soares_administradora_condominios/resident/infra/datasource/datasource.resident.dart';

class ResidentFirebase implements IResidentDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;
  ResidentFirebase(
      this.firebaseFirestore, this.firebaseAuth, this.firebaseStorage);

  @override
  Future<void> registerResident(Map<String, dynamic> residentMap) async {
    final uid = firebaseAuth.currentUser!.uid;
    var ref = firebaseFirestore.collection('home_units').doc(uid);
    final getdocumento = ref.get();
    await getdocumento.then((documentoSnap) async {
      final map = documentoSnap.data();
      final docResidents = map!['residents'] as List;
      docResidents.add(residentMap);
      await ref.update({'residents': docResidents});
    });
  }
}
