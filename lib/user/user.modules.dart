import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/user/domain/irepositories/irepository.user.unit.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/add.profile.image.user.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/authenticate.user.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/delete.profile.image.user.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/fetch.user.usecase.dart';
import 'package:soares_administradora_condominios/user/domain/usecase/update.value.user.usecase.dart';
import 'package:soares_administradora_condominios/user/external/user.firebase.external.dart';
import 'package:soares_administradora_condominios/user/infra/datasource/datasource.user.dart';
import 'package:soares_administradora_condominios/user/infra/repositories/repository.user.dart';

final UserModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<FirebaseAuth>.value(
    value: FirebaseAuth.instance,
  ),
  Provider<FirebaseStorage>.value(
    value: FirebaseStorage.instance,
  ),
  Provider<IUserDataSource>(
      create: (context) =>
          UserFirebase(context.read(), context.read(), context.read())),
  Provider<IUserRepository>(
      create: (context) => UserRepository(context.read())),
  //usecases
  Provider<IAuthenticateUser>(
      create: (context) => AuthenticateUser(context.read())),
  Provider<IFetchUser>(create: (context) => FetchUser(context.read())),
  Provider<IAddProfileImageUser>(
      create: (context) => AddProfileImageUser(context.read())),
  Provider<IUpdateValueUser>(
      create: (context) => UpdateValueUser(context.read())),
  Provider<IDeleteProfileImageUser>(create: (context) => DeleteProfileImageUser(context.read())),
];
