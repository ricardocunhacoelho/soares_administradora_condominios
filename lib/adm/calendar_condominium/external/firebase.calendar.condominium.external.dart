import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/infra/datasource/datasource.calendar.consominium.dart';

class CalendarCondominiumFirebase implements ICalendarCondominiumDataSource {
  final FirebaseFirestore firebaseFirestore;
  CalendarCondominiumFirebase(this.firebaseFirestore);

  @override
  Stream<List> getAllTaskCondominium() {
    final ref = firebaseFirestore.collection('adm').doc('task_condominium');
    final snapshots = ref.snapshots();
    return snapshots.map(_convert);
  }

  List<dynamic> _convert(DocumentSnapshot<Map<String, dynamic>> doc) {
    final test = doc.data()!.values.toList();
    return test;
  }
}
