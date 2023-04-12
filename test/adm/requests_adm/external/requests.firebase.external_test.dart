import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/external/requests.firebase.external.dart';

void main() {
  test('oque esta vindo', () async {
    final firebase = Firebase.initializeApp();
    final firestore = FirebaseFirestore.instance;
    final storage = FirebaseStorage.instance;
    final auth = FirebaseAuth.instance;
    var ref = firestore.collection('adm').doc('requests');
    final datasource = RequestsAdmFirebase(
      firestore,
      auth,
      storage,
    );
    final result = datasource.addRequestAccessResident({'id':'idcerto'});
    print('stop');
  });
}
