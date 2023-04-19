import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soares_administradora_condominios/adm/news_wall/infra/datasource/datasource.news.wall.dart';

class NewsWallFirebase implements INewsWallDataSource {
  final FirebaseFirestore firebaseFirestore;
  NewsWallFirebase(this.firebaseFirestore);

  Stream<List<dynamic>> getAllNewsInWall() {
    final ref = firebaseFirestore.collection('adm').doc('news_wall');
    final snapshots = ref.snapshots();
    return snapshots.map(_convert);
  }

  List<dynamic> _convert(DocumentSnapshot<Map<String, dynamic>> doc) {
    final test = doc.data()!.values.toList();
    return test;
  }
}
