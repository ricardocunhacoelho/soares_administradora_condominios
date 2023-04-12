import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/infra/datasource/datasource.requests.dart';

class RequestsAdmFirebase implements IRequestsAdmDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;
  RequestsAdmFirebase(
      this.firebaseFirestore, this.firebaseAuth, this.firebaseStorage);

  @override
  Future<void> addRequestResident(
      Map<String, dynamic> mapRequestAccessResident, String type) async {
    var ref = firebaseFirestore.collection('adm').doc('requests');
    final getdocumento = ref.get();
    await getdocumento.then((documentoSnap) async {
      final map = documentoSnap.data();
      final docRequest = map![type] as List;
      docRequest.add(mapRequestAccessResident);
      await ref.update({type: docRequest});
    });
  }
}
