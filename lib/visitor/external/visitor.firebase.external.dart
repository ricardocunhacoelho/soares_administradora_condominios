import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:soares_administradora_condominios/visitor/infra/datasource/datasource.visitor.dart';

class VisitorFirebase implements IVisitorDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;
  VisitorFirebase(this.firebaseFirestore, this.firebaseStorage);

  @override
  Future<void> registerVisitor(Map<String, dynamic> visitorMap) async {
    var ref = firebaseFirestore
        .collection('home_units')
        .doc('${visitorMap['unit']['id']}');
    final getdocumento = ref.get();
    await getdocumento.then((documentoSnap) async {
      final map = documentoSnap.data();
      final docVisitors = map!['visitors'] as List;
      docVisitors.add(visitorMap);
      await ref.update({'visitors': docVisitors});
    });
  }

  @override
  Future<void> updateValueVisitor(
      Map<String, dynamic> mapVisitor, int index) async {
    var ref = firebaseFirestore
        .collection('home_units')
        .doc(mapVisitor['unit']['id']);
    final getdocumento = ref.get();
    await getdocumento.then((documentoSnap) async {
      final map = documentoSnap.data();
      final docVisitors = map!['visitors'] as List;
      if (docVisitors[index]['cpf'] == mapVisitor['cpf']) {
        docVisitors[index] = mapVisitor;
        await ref.update({'visitors': docVisitors});
      }
    });
  }

  @override
  Future<void> deleteVisitor(String doc, String cpf, int index) async {
    var ref = firebaseFirestore.collection('home_units').doc(doc);
    final getdocumento = ref.get();
    await getdocumento.then((documentoSnap) async {
      final map = documentoSnap.data();
      final docVisitors = map!['visitors'] as List;
      if (docVisitors[index]['cpf'] == cpf) {
        if (docVisitors[index]['picture'] != '') {
          await firebaseStorage.ref('images/$cpf.jpg').delete();
          await firebaseStorage.ref('images/${cpf}_60x60.jpg').delete();
          await firebaseStorage.ref('images/${cpf}_200x200.jpg').delete();
        }
        docVisitors.removeAt(index);
        await ref.update({'visitors': docVisitors});
      } else {
        final indexCorrect =
            docVisitors.indexWhere((element) => element['cpf'] == cpf);
        if (docVisitors[indexCorrect]['picture'] != '') {
          await firebaseStorage.ref('images/$cpf.jpg').delete();
          await firebaseStorage.ref('images/${cpf}_60x60.jpg').delete();
          await firebaseStorage.ref('images/${cpf}_200x200.jpg').delete();
        }
        docVisitors.removeAt(indexCorrect);
        await ref.update({'visitors': docVisitors});
      }
    });
  }
}
