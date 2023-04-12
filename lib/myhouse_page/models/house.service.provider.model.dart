import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

class HouseServiceProviderModel extends HouseServiceProviderEntity {
  HouseServiceProviderModel({
    required String id,
    required String name,
    required DateTime bornDate,
    required String cpf,
    required String phoneNumber,
    required String? picture,
    required UnitEntity unit,
    required bool freePass,
    required DateTime startWorkDate,
    required TimeOfDay? workStartTimeDay,
    required TimeOfDay? endOfWorkTimeDay,
    required DateTime? finishWorkDate,
    required bool recurringService,
    required List daysWeekAccess
  }) : super(
          id: id,
          name: name,
          bornDate: bornDate,
          cpf: cpf,
          phoneNumber: phoneNumber,
          picture: picture,
          unit: unit,
          freePass: freePass,
          startWorkDate: startWorkDate,
          workStartTimeDay: workStartTimeDay,
          endOfWorkTimeDay: endOfWorkTimeDay,
          finishWorkDate: finishWorkDate,
          recurringService: recurringService,
          daysWeekAccess: daysWeekAccess,
        );

  factory HouseServiceProviderModel.empty() => HouseServiceProviderModel(
        id: '',
        name: '',
        cpf: '',
        bornDate: DateTime(0, 0, 0),
        phoneNumber: '',
        picture: '',
        unit: UnitEntity(id: '', block: '', number: 0),
        freePass: false,
        startWorkDate: DateTime(0, 0, 0),
        workStartTimeDay: TimeOfDay.now(),
        endOfWorkTimeDay: TimeOfDay.now(),
        finishWorkDate: DateTime(0, 0, 0),
        recurringService: false,
        daysWeekAccess: [],
      );
  HouseServiceProviderModel copyWith({
    String? id,
    String? name,
    DateTime? bornDate,
    String? cpf,
    String? phoneNumber,
    String? picture,
    UnitEntity? unit,
    bool? freePass,
    DateTime? startWorkDate,
    TimeOfDay? workStartTimeDay,
    TimeOfDay? endOfWorkTimeDay,
    DateTime? finishWorkDate,
    bool? recurringService,
    List? daysWeekAccess
  }) {
    return HouseServiceProviderModel(
      id: id ?? this.id,
      name: name ?? this.name,
      bornDate: bornDate ?? this.bornDate,
      cpf: cpf ?? this.cpf,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      picture: picture ?? this.picture,
      unit: unit ?? this.unit,
      freePass: freePass ?? this.freePass,
      startWorkDate: startWorkDate ?? this.startWorkDate,
      workStartTimeDay: workStartTimeDay ?? this.workStartTimeDay,
      endOfWorkTimeDay: endOfWorkTimeDay ?? this.endOfWorkTimeDay,
      finishWorkDate: finishWorkDate ?? this.finishWorkDate,
      recurringService: recurringService ?? this.recurringService,
      daysWeekAccess: daysWeekAccess ?? this.daysWeekAccess,
    );
  }

  factory HouseServiceProviderModel.converter(HouseServiceProviderEntity houseServiceProvider) => HouseServiceProviderModel(
        id: houseServiceProvider.id,
        name: houseServiceProvider.name,
        bornDate: houseServiceProvider.bornDate,
        cpf: houseServiceProvider.cpf,
        phoneNumber: houseServiceProvider.phoneNumber,
        picture: houseServiceProvider.picture,
        unit: houseServiceProvider.unit,
        freePass: houseServiceProvider.freePass,
        startWorkDate: houseServiceProvider.startWorkDate,
        workStartTimeDay: houseServiceProvider.workStartTimeDay,
        endOfWorkTimeDay: houseServiceProvider.endOfWorkTimeDay,
        finishWorkDate: houseServiceProvider.finishWorkDate,
        recurringService: houseServiceProvider.recurringService,
        daysWeekAccess: houseServiceProvider.daysWeekAccess,
      );
}
