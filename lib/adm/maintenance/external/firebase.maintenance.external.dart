import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soares_administradora_condominios/adm/maintenance/infra/datasource/datasource.maintenance.dart';

class MaintenanceFirebase implements IMaintenanceDataSource {
  final FirebaseFirestore firebaseFirestore;
  MaintenanceFirebase(this.firebaseFirestore);

  @override
  Future<void> requestMaintenance(mapMaintenance) async {
    firebaseFirestore
        .collection('maintenance')
        .doc(mapMaintenance['id'])
        .set(mapMaintenance);
  }
}
