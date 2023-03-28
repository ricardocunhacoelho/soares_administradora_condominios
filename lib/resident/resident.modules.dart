import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/resident/domain/irepository/irepository.resident.dart';
import 'package:soares_administradora_condominios/resident/domain/usecases/delete.resident.usecase.dart';
import 'package:soares_administradora_condominios/resident/domain/usecases/register.resident.usecase.dart';
import 'package:soares_administradora_condominios/resident/domain/usecases/update.value.resident.usecase.dart';
import 'package:soares_administradora_condominios/resident/external/resident.firebase.external.dart';
import 'package:soares_administradora_condominios/resident/infra/datasource/datasource.resident.dart';
import 'package:soares_administradora_condominios/resident/infra/repositories/repository.resident.dart';

final residentModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<FirebaseAuth>.value(
    value: FirebaseAuth.instance,
  ),
  Provider<FirebaseStorage>.value(
    value: FirebaseStorage.instance,
  ),
  Provider<IResidentDataSource>(
      create: (context) =>
          ResidentFirebase(context.read(), context.read(), context.read())),
  Provider<IResidentRepository>(
      create: (context) => ResidentRepository(context.read())),
  //usecases
  Provider<IRegisterResident>(
      create: (context) => RegisterResident(context.read())),
  Provider<IUpdateValueResident>(
      create: (context) => UpdateValueResident(context.read())),
  Provider<IDeleteResident>(
      create: (context) => DeleteResident(context.read())),
];
