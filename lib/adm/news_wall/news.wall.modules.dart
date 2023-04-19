import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/news_wall/domain/irepositories/irepository.news.wall.dart';
import 'package:soares_administradora_condominios/adm/news_wall/domain/usecases/get.all.news.in.wall.dart';
import 'package:soares_administradora_condominios/adm/news_wall/external/firebase.news.wall.external.dart';
import 'package:soares_administradora_condominios/adm/news_wall/infra/datasource/datasource.news.wall.dart';
import 'package:soares_administradora_condominios/adm/news_wall/infra/repositories/repository.news.wall.dart';


final newsWallModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<INewsWallDataSource>(
      create: (context) =>
          NewsWallFirebase(context.read())),
  Provider<INewsWallRepository>(
      create: (context) => NewsWallRepository(context.read())),
  //usecases
  Provider<IGetAllNewsInWall>(
      create: (context) => GetAllNewsInWall(context.read())),
];
