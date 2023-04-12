import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:soares_administradora_condominios/app.style.dart';
import 'package:soares_administradora_condominios/size.config.dart';

class QrCodeResident extends StatefulWidget {
  final String uid;
  final String name;
  const QrCodeResident({super.key, required this.uid, required this.name});

  @override
  State<QrCodeResident> createState() => _QrCodeResidentState();
}

class _QrCodeResidentState extends State<QrCodeResident> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: QrImage(
        data: widget.uid,
        size: 130,
      ),
    );
  }
}
