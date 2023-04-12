import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/home_unit/domain/irepositories/irepository.home.unit.dart';
import 'package:soares_administradora_condominios/home_unit/domain/usecases/fetch.home.unit.usecase.dart';
import 'package:soares_administradora_condominios/home_unit/external/home.unit.firebase.external.dart';
import 'package:soares_administradora_condominios/home_unit/infra/datasource/datasource.home.unit.dart';
import 'package:soares_administradora_condominios/home_unit/infra/repositories/repository.home.unit.dart';

final homeUnitModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<FirebaseAuth>.value(
    value: FirebaseAuth.instance,
  ),
  Provider<IHomeUnitDataSource>(
      create: (context) => HomeUnitFirebase(context.read(), context.read())),
  Provider<IHomeUnitRepository>(
      create: (context) => HomeUnitRepository(context.read())),
  //usecases
  Provider<IFetchHomeUnit>(create: (context) => FetchHomeUnit(context.read())),
];
