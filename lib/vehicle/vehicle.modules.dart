import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/vehicle/domain/irepositories/irepository.vehicle.dart';
import 'package:soares_administradora_condominios/vehicle/domain/usecases/delete.vehicle.usecase.dart';
import 'package:soares_administradora_condominios/vehicle/domain/usecases/register.vehicle.usecase.dart';
import 'package:soares_administradora_condominios/vehicle/external/vehicle.firebase.external.dart';
import 'package:soares_administradora_condominios/vehicle/infra/datasource/datasource.vehicle.dart';
import 'package:soares_administradora_condominios/vehicle/infra/repositories/repository.vehicle.dart';

final vehicleModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<IVehicleDataSource>(
      create: (context) =>
          VehicleFirebase(context.read())),
  Provider<IVehicleRepository>(
      create: (context) => VehicleRepository(context.read())),
  //usecases
  Provider<IRegisterVehicle>(
      create: (context) => RegisterVehicle(context.read())),
  Provider<IDeleteVehicle>(
      create: (context) => DeleteVehicle(context.read())),
];
