import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soares_administradora_condominios/adm/employee/infra/datasource/datasource.employee.dart';

class EmployeeFirebase implements IEmployeeDataSource {
  final FirebaseFirestore firebaseFirestore;
  EmployeeFirebase(this.firebaseFirestore);

  @override
  Stream<List> getAllEmployee() {
    final ref = firebaseFirestore.collection('adm').doc('employees');
    final snapshots = ref.snapshots();
    return snapshots.map(_convert);
  }

  List<dynamic> _convert(DocumentSnapshot<Map<String, dynamic>> doc) {
    final test = doc.data()!.values.toList();
    return test;
  }
}
