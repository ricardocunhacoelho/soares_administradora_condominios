import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';

final loginModules = [
  BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(context.read(), context.read())),
];
