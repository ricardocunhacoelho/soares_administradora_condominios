// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:soares_administradora_condominios/firebase_options.dart';

// void main() {
//   test('description', () async {
//     final firebaseFirestore = FirebaseFirestore.instance;
//     final ref = firebaseFirestore.collection('adm').doc('news_wall');
//     final snapshots = ref.snapshots();
//     List<dynamic> _convert(DocumentSnapshot<Map<String, dynamic>> doc) {
//       return doc.data()!['news_wall'] as List;
//     }

//     final value = snapshots.map(_convert);
//     print(value);
//   });
// }
