import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soares_administradora_condominios/adm/lost_found/infra/datasource/datasource.lost.found.dart';

class LostFoundFirebase implements ILostFoundDataSource {
  final FirebaseFirestore firebaseFirestore;
  LostFoundFirebase(this.firebaseFirestore);

  @override
  Stream<List> getAllLostFound() {
    final ref = firebaseFirestore.collection('adm').doc('lost_found');
    final snapshots = ref.snapshots();
    return snapshots.map(_convert);
  }

  List<dynamic> _convert(DocumentSnapshot<Map<String, dynamic>> doc) {
    final test = doc.data()!.values.toList();
    return test;
  }
}
