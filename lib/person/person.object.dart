import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

class PersonObject {
  final String name;
  final EPersonType ePersonType;
  final String cpf;
  final String phoneNumber;
  final UnitEntity unit;
  final String qrData;

  PersonObject({
    required this.name,
    required this.ePersonType,
    required this.cpf,
    required this.phoneNumber,
    required this.unit,
    required this.qrData,
  });
}

enum EPersonType { morador, visita, funcionario }
