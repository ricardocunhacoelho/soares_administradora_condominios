import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:soares_administradora_condominios/house_service_provider/infra/datasource/datasource.house.service.provider.dart';

class HouseServiceProviderFirebase implements IHouseServiceProviderDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;
  HouseServiceProviderFirebase(this.firebaseFirestore, this.firebaseStorage);

  @override
  Future<void> registerHouseServiceProvider(
      Map<String, dynamic> houseServiceProviderMap) async {
    var ref = firebaseFirestore
        .collection('home_units')
        .doc('${houseServiceProviderMap['unit']['id']}');
    final getdocumento = ref.get();
    await getdocumento.then((documentoSnap) async {
      final map = documentoSnap.data();
      final docHouseServiceProviders = map!['houseServiceProviders'] as List;
      docHouseServiceProviders.add(houseServiceProviderMap);
      await ref.update({'houseServiceProviders': docHouseServiceProviders});
    });
  }

  @override
  Future<void> updateValueHouseServiceProvider(
      Map<String, dynamic> mapHouseServiceProvider, int index) async {
    var ref = firebaseFirestore
        .collection('home_units')
        .doc(mapHouseServiceProvider['unit']['id']);
    final getdocumento = ref.get();
    await getdocumento.then((documentoSnap) async {
      final map = documentoSnap.data();
      final docHouseServiceProviders = map!['houseServiceProviders'] as List;
      if (docHouseServiceProviders[index]['cpf'] ==
          mapHouseServiceProvider['cpf']) {
        docHouseServiceProviders[index] = mapHouseServiceProvider;
        await ref.update({'houseServiceProviders': docHouseServiceProviders});
      }
    });
  }

  @override
  Future<void> deleteHouseServiceProvider(
      String doc, String cpf, int index) async {
    var ref = firebaseFirestore.collection('home_units').doc(doc);
    final getdocumento = ref.get();
    await getdocumento.then((documentoSnap) async {
      final map = documentoSnap.data();
      final docHouseServiceProviders = map!['houseServiceProviders'] as List;
      if (docHouseServiceProviders[index]['cpf'] == cpf) {
        if (docHouseServiceProviders[index]['picture'] != '') {
          await firebaseStorage.ref('images/$cpf.jpg').delete();
          await firebaseStorage.ref('images/${cpf}_60x60.jpg').delete();
          await firebaseStorage.ref('images/${cpf}_200x200.jpg').delete();
        }
        docHouseServiceProviders.removeAt(index);
        await ref.update({'houseServiceProviders': docHouseServiceProviders});
      } else {
        final indexCorrect = docHouseServiceProviders
            .indexWhere((element) => element['cpf'] == cpf);
        if (docHouseServiceProviders[indexCorrect]['picture'] != '') {
          await firebaseStorage.ref('images/$cpf.jpg').delete();
          await firebaseStorage.ref('images/${cpf}_60x60.jpg').delete();
          await firebaseStorage.ref('images/${cpf}_200x200.jpg').delete();
        }
        docHouseServiceProviders.removeAt(indexCorrect);
        await ref.update({'houseServiceProviders': docHouseServiceProviders});
      }
    });
  }
}
