import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/infra/datasource/datasource.called.dart';

class CalledFirebase implements ICalledDataSource {
  final FirebaseFirestore firebaseFirestore;
  CalledFirebase(this.firebaseFirestore);

  @override
  Future<void> sendCalled(Map<String, dynamic> calledMap) async {
    firebaseFirestore
        .collection('called_condominium')
        .doc(calledMap['id'])
        .set(calledMap);
  }
}