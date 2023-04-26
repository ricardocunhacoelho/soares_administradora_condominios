import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/irepositories/irepository.news.wall.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/usecases/get.all.task.condominium.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/external/firebase.calendar.condominium.external.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/infra/datasource/datasource.calendar.consominium.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/infra/repositories/repository.calendar.condominium.dart';
import 'package:soares_administradora_condominios/adm/lost_found/domain/irepositories/irepository.lost.found.dart';
import 'package:soares_administradora_condominios/adm/lost_found/domain/usecases/get.all.lost.found.condominium.dart';
import 'package:soares_administradora_condominios/adm/lost_found/external/firebase.lost.found.external.dart';
import 'package:soares_administradora_condominios/adm/lost_found/infra/datasource/datasource.lost.found.dart';
import 'package:soares_administradora_condominios/adm/lost_found/infra/repositories/repository.lost.found.dart';



final lostFoundModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<ILostFoundDataSource>(
      create: (context) =>
          LostFoundFirebase(context.read())),
  Provider<ILostFoundRepository>(
      create: (context) => LostFoundRepository(context.read())),
  //usecases
  Provider<IGetAllLostFound>(
      create: (context) => GetAllLostFound(context.read())),
];
