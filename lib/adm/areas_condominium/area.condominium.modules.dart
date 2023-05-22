import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/irepositories/irepository.area.condominium.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/usecases/fetch.area.usecase.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/usecases/get.all.area.condominium.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/usecases/make.reserve.usecase.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/external/firebase.area.condominium.external.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/infra/datasource/datasource.area.condominium.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/infra/repositories/repository.area.condominium.dart';

final areaCondominiumModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<IAreaCondominiumDataSource>(
      create: (context) => AreaCondominiumFirebase(context.read())),
  Provider<IAreaCondominiumRepository>(
      create: (context) => AreaCondominiumRepository(context.read())),
  //usecases
  Provider<IGetAllAreaCondominium>(
      create: (context) => GetAllAreaCondominium(context.read())),
  Provider<IFetchArea>(create: (context) => FetchArea(context.read())),
  Provider<IMakeReserve>(create: (context) => MakeReserve(context.read())),
];
