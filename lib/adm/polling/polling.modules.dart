import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/irepositories/irepository.polling.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/usecases/answer.polling.usecase.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/usecases/get.all.polling.usecase.dart';
import 'package:soares_administradora_condominios/adm/polling/external/firebase.polling.external.dart';
import 'package:soares_administradora_condominios/adm/polling/infra/datasource/datasource.polling.dart';
import 'package:soares_administradora_condominios/adm/polling/infra/repositories/repository.polling.dart';

final pollingModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<IPollingDataSource>(
      create: (context) => PollingFirebase(context.read())),
  Provider<IPollingRepository>(
      create: (context) => PollingRepository(context.read())),
  //usecases
  Provider<IGetAllPolling>(create: (context) => GetAllPolling(context.read())),
  Provider<IAnswerPolling>(create: (context) => AnswerPolling(context.read())),
];
