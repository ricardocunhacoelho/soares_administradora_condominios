import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/visitor/domain/usecases/delete.visitor.usecase.dart';
import 'package:soares_administradora_condominios/visitor/domain/usecases/update.value.visitor.usecase.dart';
import 'package:soares_administradora_condominios/visitor/infra/datasource/datasource.visitor.dart';
import 'package:soares_administradora_condominios/visitor/domain/irepositories/irepository.visitor.dart';
import 'package:soares_administradora_condominios/visitor/domain/usecases/visitor.register.usecase.dart';
import 'package:soares_administradora_condominios/visitor/external/visitor.firebase.external.dart';

import 'package:soares_administradora_condominios/visitor/infra/repositories/repository.visitor.dart';

final visitorModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<FirebaseStorage>.value(
    value: FirebaseStorage.instance,
  ),
  Provider<IVisitorDataSource>(
      create: (context) => VisitorFirebase(context.read(), context.read())),
  Provider<IVisitorRepository>(
      create: (context) => VisitorRepository(context.read())),
  //usecases
  Provider<IRegisterVisitor>(
      create: (context) => RegisterVisitor(context.read())),
  Provider<IUpdateValueVisitor>(
      create: (context) => UpdateValueVisitor(context.read())),
  Provider<IDeleteVisitor>(
      create: (context) => DeleteVisitor(context.read())),
];
