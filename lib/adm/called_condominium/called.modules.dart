
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/domain/irepositories/irepository.called.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/domain/usecases/send.called.usecase.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/external/firebase.called.external.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/infra/datasource/datasource.called.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/infra/repositories/repository.called.dart';

final calledModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<ICalledDataSource>(
      create: (context) => CalledFirebase(context.read())),
  Provider<ICalledRepository>(
      create: (context) => CalledRepository(context.read())),
  //usecases
  Provider<ISendCalled>(create: (context) => SendCalled(context.read())),
];
