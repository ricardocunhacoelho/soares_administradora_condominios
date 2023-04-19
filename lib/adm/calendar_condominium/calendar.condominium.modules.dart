import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/irepositories/irepository.news.wall.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/usecases/get.all.task.condominium.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/external/firebase.calendar.condominium.external.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/infra/datasource/datasource.calendar.consominium.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/infra/repositories/repository.calendar.condominium.dart';



final calendarCondominiumModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<ICalendarCondominiumDataSource>(
      create: (context) =>
          CalendarCondominiumFirebase(context.read())),
  Provider<ICalendarCondominiumRepository>(
      create: (context) => CalendarCondominiumRepository(context.read())),
  //usecases
  Provider<IGetAllTaskCondominium>(
      create: (context) => GetAllTaskCondominium(context.read())),
];
