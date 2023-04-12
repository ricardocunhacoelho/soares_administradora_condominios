import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/irepositories/irepository.house.service.provider.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/usecases/delete.house.service.provider.usecase.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/usecases/register.house.service.provider.usecase.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/usecases/update.value.hosue.service.provider.usecase.dart';
import 'package:soares_administradora_condominios/house_service_provider/external/house.service.provider.firebase.external.dart';
import 'package:soares_administradora_condominios/house_service_provider/infra/datasource/datasource.house.service.provider.dart';
import 'package:soares_administradora_condominios/house_service_provider/infra/repositories/repository.house.service.provider.dart';

final houseServiceProviderModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<FirebaseStorage>.value(
    value: FirebaseStorage.instance,
  ),
  Provider<IHouseServiceProviderDataSource>(
      create: (context) =>
          HouseServiceProviderFirebase(context.read(), context.read())),
  Provider<IHouseServiceProviderRepository>(
      create: (context) => HouseServiceProviderRepository(context.read())),
  //usecases
  Provider<IRegisterHouseServiceProvider>(
      create: (context) => RegisterHouseServiceProvider(context.read())),
  Provider<IUpdateValueHouseServiceProvider>(
      create: (context) => UpdateValueHouseServiceProvider(context.read())),
  Provider<IDeleteHouseServiceProvider>(
      create: (context) => DeleteHouseServiceProvider(context.read())),
];
