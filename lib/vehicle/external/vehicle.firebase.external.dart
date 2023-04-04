import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soares_administradora_condominios/vehicle/infra/datasource/datasource.vehicle.dart';

class VehicleFirebase implements IVehicleDataSource {
  final FirebaseFirestore firebaseFirestore;
  VehicleFirebase(this.firebaseFirestore);

  @override
  Future<void> registerVehicle(
      Map<String, dynamic> vehicleMap, String idUnit) async {
    var ref = firebaseFirestore.collection('home_units').doc(idUnit);
    final getdocumento = ref.get();
    await getdocumento.then((documentoSnap) async {
      final map = documentoSnap.data();
      final docVehicles = map!['vehicles'] as List;
      docVehicles.add(vehicleMap);
      await ref.update({'vehicles': docVehicles});
    });
  }

  @override
  Future<void> deleteVehicle(String idUnit, String plate, int index) async {
    var ref = firebaseFirestore.collection('home_units').doc(idUnit);
    final getdocumento = ref.get();
    await getdocumento.then((documentoSnap) async {
      final map = documentoSnap.data();
      final docResidents = map!['vehicles'] as List;
      if (docResidents[index]['plate'] == plate) {
        docResidents.removeAt(index);
        await ref.update({'vehicles': docResidents});
      } else {
        final indexValue =
            docResidents.indexWhere((element) => element['plate'] == plate);
        docResidents.removeAt(indexValue);
        await ref.update({'vehicles': docResidents});
      }
    });
  }

  @override
  Future<void> updateValueVehicle(Map<String, dynamic> mapVehicle, int index) {
    // TODO: implement updateValueVehicle
    throw UnimplementedError();
  }
}
