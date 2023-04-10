import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

class HouseServiceProviderEntity{
  final String id;
  final String name;
  final DateTime bornDate;
  final String cpf;
  final String phoneNumber;
  final String? picture;
  final bool freePass;
  final UnitEntity unit;
  final DateTime startWorkDate;
  final TimeOfDay? workStartTimeDay;
  final TimeOfDay? endOfWorkTimeDay;
  final DateTime? finishWorkDate;
  final bool recurringService;
  final List daysWeekAccess;

  HouseServiceProviderEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.bornDate,
    required this.phoneNumber,
    this.picture,
    required this.freePass,
    required this.unit,
    required this.startWorkDate,
    this.workStartTimeDay,
    this.endOfWorkTimeDay,
    this.finishWorkDate,
    required this.recurringService,
    required this.daysWeekAccess,
  });
}
