import 'package:flutter/material.dart';

mixin CompleteStateMixinMainPage<T extends StatefulWidget> on State<T> {
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
