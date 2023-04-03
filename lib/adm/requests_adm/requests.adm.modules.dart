import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/irepositories/irespository.requests.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/usecases/add.request.access.resident.usecase.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/usecases/generate.request.access.resident.usecase.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/external/requests.firebase.external.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/infra/datasource/datasource.requests.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/infra/repositories/repository.requests.dart';

final requestsAdmModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<FirebaseAuth>.value(
    value: FirebaseAuth.instance,
  ),
  Provider<FirebaseStorage>.value(
    value: FirebaseStorage.instance,
  ),
  Provider<IRequestsAdmDataSource>(
      create: (context) =>
          RequestsAdmFirebase(context.read(), context.read(), context.read())),
  Provider<IRequestsAdmRepository>(
      create: (context) => RequestsAdmRepository(context.read())),
  //usecases
  Provider<IAddRequestResident>(
      create: (context) => AddRequestResident(context.read())),
  Provider<IGenerateRequestResident>(
      create: (context) => GenerateRequestResident()),
];
