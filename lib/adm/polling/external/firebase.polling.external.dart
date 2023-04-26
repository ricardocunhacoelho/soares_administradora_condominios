import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soares_administradora_condominios/adm/polling/infra/datasource/datasource.polling.dart';

class PollingFirebase implements IPollingDataSource {
  final FirebaseFirestore firebaseFirestore;
  PollingFirebase(this.firebaseFirestore);

  Stream<List<dynamic>> getAllPolling() {
    final ref = firebaseFirestore.collection('pollings');
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
  Future<void> answerPolling(
      String uid,
      List<Map<String, dynamic>> listMapPollings,
      Map<String, dynamic> responsePolling,
      Map pollingMap) async {
    final id = pollingMap['id'];
    List listPoll = listMapPollings;

    final alreadyAnswered =
        listMapPollings.any((element) => element.containsValue(id));
    if (alreadyAnswered) {
      final index =
          listMapPollings.indexWhere((element) => element.containsValue(id));
      listPoll[index] = responsePolling;
    } else {
      listPoll.add(responsePolling);
    }
    final refUser = firebaseFirestore.collection('users').doc(uid);

    final refUserPollingResponses =
        firebaseFirestore.collection('user_polling_responses').doc(uid);

    await refUserPollingResponses.set(responsePolling);
    refUser.update({'answeredPolling': listPoll});
  }
}
