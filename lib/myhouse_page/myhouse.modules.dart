import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';

final myHouseModules = [
  BlocProvider<MyHouseBloc>(
      create: (context) => MyHouseBloc(context.read(),context.read(),context.read(), context.read())),
];
