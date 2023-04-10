
import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

class VisitorEntity{
  final String id;
  final String name;
  final DateTime bornDate;
  final String cpf;
  final String phoneNumber;
  final String? picture;
  final UnitEntity unit;
  final bool freePass;
  final DateTime startaccessDate;
  final TimeOfDay? startTimeAccessDay;
  final TimeOfDay? endTimeAccessDay;
  final DateTime? finishaccessDate;
  VisitorEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.bornDate,
    required this.phoneNumber,
    required this.picture,
    required this.unit,
    required this.freePass,
    required this.startaccessDate,
    required this.startTimeAccessDay,
    required this.endTimeAccessDay,
    this.finishaccessDate,
  });
}
