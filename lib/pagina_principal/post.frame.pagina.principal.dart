import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin CompleteStateMixinPaginaPrincipal<T extends StatefulWidget> on State<T> {
  void completeState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //iniciar eventos
      completeState();
    });
  }
}
