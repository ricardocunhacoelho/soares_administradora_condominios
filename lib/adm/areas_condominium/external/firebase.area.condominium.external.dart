import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/infra/datasource/datasource.area.condominium.dart';

class AreaCondominiumFirebase implements IAreaCondominiumDataSource {
  final FirebaseFirestore firebaseFirestore;
  AreaCondominiumFirebase(this.firebaseFirestore);

  @override
  Stream<List<dynamic>> getAllAreaCondominium() {
    final ref = firebaseFirestore.collection('area_condominium');
    final snapshots = ref.snapshots();

    return snapshots.map((e) => e.docs).map(_convert);
  }

  List<Map> _convert(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    return docs
        .map(
          (documents) => {
            'id': documents.id,
            ...documents.data(),
          },
        )
        .toList();
  }

  @override
  Stream<Map> fetchArea(String id) {
    final docRef = firebaseFirestore.collection("area_condominium").doc(id);
    final snapshots = docRef.snapshots();
    return snapshots.map(_convertArea);
  }

  Map<dynamic, dynamic> _convertArea(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    var ex = {
      'id': doc.id,
      ...doc.data()!,
    };
    print(ex);
    return ex;
  }

  @override
  Future<void> makeReserve(Map<String, dynamic> mapReserve, String uid) async {
    final docRefUser = firebaseFirestore.collection("users").doc(uid);
    final docRefArea = firebaseFirestore
        .collection("area_condominium")
        .doc(mapReserve['areaCondominium']['id']);
    final documentArea = docRefArea.get();
    final documentUser = docRefUser.get();
    await documentArea.then((documentoSnap) async {
      final map = documentoSnap.data();
      final reserveDates = map!['reserveDateList'] as List;

      await docRefArea.update({
        'reserveDateList': [...reserveDates, mapReserve['reservationDate']]
      });
    });
    await documentUser.then((documentoSnap) async {
      final map = documentoSnap.data();
      final reserves = map!['reserves'] as List;

      await docRefUser.update({
        'reserves': [...reserves, mapReserve]
      });
    });
  }
}
