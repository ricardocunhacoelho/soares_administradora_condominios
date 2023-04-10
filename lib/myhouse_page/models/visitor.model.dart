import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';

class VisitorModel extends VisitorEntity {
  VisitorModel({
    required String id,
    required String name,
    required DateTime bornDate,
    required String cpf,
    required String phoneNumber,
    required String? picture,
    required UnitEntity unit,
    required bool freePass,
    required DateTime startaccessDate,
    required TimeOfDay? startTimeAccessDay,
    required TimeOfDay? endTimeAccessDay,
    required DateTime? finishaccessDate,
  }) : super(
          id: id,
          name: name,
          bornDate: bornDate,
          cpf: cpf,
          phoneNumber: phoneNumber,
          picture: picture,
          unit: unit,
          freePass: freePass,
          startaccessDate: startaccessDate,
          startTimeAccessDay: startTimeAccessDay,
          endTimeAccessDay: endTimeAccessDay,
          finishaccessDate: finishaccessDate,
        );

  factory VisitorModel.empty() => VisitorModel(
        id: '',
        name: '',
        cpf: '',
        bornDate: DateTime(0, 0, 0),
        phoneNumber: '',
        picture: '',
        unit: UnitEntity(id: '', block: '', number: 0),
        freePass: false,
        startaccessDate: DateTime(0, 0, 0),
        startTimeAccessDay: TimeOfDay.now(),
        endTimeAccessDay: TimeOfDay.now(),
        finishaccessDate: DateTime(0, 0, 0),
      );
  VisitorModel copyWith({
    String? id,
    String? name,
    DateTime? bornDate,
    String? cpf,
    String? phoneNumber,
    String? picture,
    bool? access,
    UnitEntity? unit,
    bool? freePass,
    DateTime? startaccessDate,
    TimeOfDay? startTimeAccessDay,
    TimeOfDay? endTimeAccessDay,
    DateTime? finishaccessDate,
  }) {
    return VisitorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      bornDate: bornDate ?? this.bornDate,
      cpf: cpf ?? this.cpf,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      picture: picture ?? this.picture,
      unit: unit ?? this.unit,
      freePass: freePass ?? this.freePass,
      startaccessDate: startaccessDate ?? this.startaccessDate,
      startTimeAccessDay: startTimeAccessDay ?? this.startTimeAccessDay,
      endTimeAccessDay: endTimeAccessDay ?? this.endTimeAccessDay,
      finishaccessDate: finishaccessDate ?? this.finishaccessDate,
    );
  }

  factory VisitorModel.converter(VisitorEntity visitor) => VisitorModel(
        id: visitor.id,
        name: visitor.name,
        bornDate: visitor.bornDate,
        cpf: visitor.cpf,
        phoneNumber: visitor.phoneNumber,
        picture: visitor.picture,
        unit: visitor.unit,
        freePass: visitor.freePass,
        startaccessDate: visitor.startaccessDate,
        startTimeAccessDay: visitor.startTimeAccessDay,
        endTimeAccessDay: visitor.endTimeAccessDay,
        finishaccessDate: visitor.finishaccessDate,
      );
}
