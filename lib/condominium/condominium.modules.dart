import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/called.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.employee.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.lost.found.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.news.wall.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.polling.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.task.condominium.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/maintenance.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/polling.bloc.dart';

final condominiumModules = [
  BlocProvider<GetNewsWallBloc>(
      create: (context) => GetNewsWallBloc(context.read())),

  BlocProvider<GetTaskCondominiumBloc>(
      create: (context) => GetTaskCondominiumBloc(context.read())),

  BlocProvider<GetLostFoundBloc>(
      create: (context) => GetLostFoundBloc(context.read())),

  BlocProvider<GetEmployeeBloc>(
      create: (context) => GetEmployeeBloc(context.read())),

  BlocProvider<GetPollingBloc>(
      create: (context) => GetPollingBloc(context.read())),

  BlocProvider<PollingBloc>(
      create: (context) => PollingBloc(context.read())),
  
  BlocProvider<CalledBloc>(
      create: (context) => CalledBloc(context.read())),

  BlocProvider<MaintenanceBloc>(
      create: (context) => MaintenanceBloc(context.read())),
];
