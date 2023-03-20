
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddProfileImageDialogComponente extends StatefulWidget {
  @override
  _AddProfileImageDialogComponenteState createState() =>
      new _AddProfileImageDialogComponenteState();
}

class _AddProfileImageDialogComponenteState
    extends State<AddProfileImageDialogComponente> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Tirar foto')),
        TextButton(
            onPressed: () {
              
            },
            child: Text('Escolher foto')),
      ],
    );
  }
}
