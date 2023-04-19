import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.news.wall.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.task.condominium.bloc.dart';

final condominiumModules = [
  BlocProvider<GetNewsWallBloc>(
      create: (context) => GetNewsWallBloc(context.read())),

  BlocProvider<GetTaskCondominiumBloc>(
      create: (context) => GetTaskCondominiumBloc(context.read())),
];
