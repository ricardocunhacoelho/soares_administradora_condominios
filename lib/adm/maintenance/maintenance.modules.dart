
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/maintenance/domain/irepositories/irepository.maintenance.dart';
import 'package:soares_administradora_condominios/adm/maintenance/domain/usecases/request.maintenance.usecase.dart';
import 'package:soares_administradora_condominios/adm/maintenance/external/firebase.maintenance.external.dart';
import 'package:soares_administradora_condominios/adm/maintenance/infra/datasource/datasource.maintenance.dart';
import 'package:soares_administradora_condominios/adm/maintenance/infra/repositories/repository.maintenance.dart';

final maintenanceModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<IMaintenanceDataSource>(
      create: (context) => MaintenanceFirebase(context.read())),
  Provider<IMaintenanceRepository>(
      create: (context) => MaintenanceRepository(context.read())),
  //usecases
  Provider<IRequestMaintenance>(create: (context) => RequestMaintenance(context.read())),
];
