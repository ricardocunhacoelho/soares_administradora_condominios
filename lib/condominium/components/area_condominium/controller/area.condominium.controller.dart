import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';
import 'package:soares_administradora_condominios/condominium/models/reserve.model.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

class AreaCondominiumController {
  final VoidCallback refresh;
  String? motivation;
  DateTime? reserveDate;
  int? numberGuests;
  String? guests;
  final formKey = GlobalKey<FormState>();
  bool foul = false;
  bool loadingFinish = false;
  bool finish = false;

  String sanitizeDateTime(DateTime dateTime) =>
      "${dateTime.year}-${dateTime.month}-${dateTime.day}";

  Set<String> getDateSet(List<DateTime> dates) =>
      dates.map(sanitizeDateTime).toSet();

  AreaCondominiumController(this.refresh);

  String? validateReserveDate(String? reserveDate) =>
      reserveDate!.isNotEmpty ? null : 'Informe uma data';
  String? validateMotivation(String? motivation) =>
      motivation!.isNotEmpty ? null : 'Necessário motivo da reserva.';
  String? validateNumberGuests(String? numberGuests) =>
      numberGuests!.isNotEmpty ? null : 'Informe número de convidados.';
  String? validateGuests(String? guests) {
    if (numberGuests! > 1) {
      guests!.isNotEmpty && guests.contains(',')
          ? null
          : 'Necessário nome dos convidados separados por virgula.';
    } else {
      guests!.isNotEmpty ? null : 'Necessário nome dos convidados.';
    }
  }

  bool validate({required GlobalKey<FormState> formKey}) {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  ReserveModel generateReserve(
      AreaCondominiumEntity area, ResidentEntity resident) {
    var reserve = ReserveModel.empty();
    reserve = reserve.copyWith(id: '${resident.id}_${area.id}_$reserveDate');
    reserve = reserve.copyWith(motivation: motivation);
    reserve = reserve.copyWith(price: area.price);
    reserve = reserve.copyWith(areaCondominium: area);
    reserve = reserve.copyWith(residentUid: resident.id);
    reserve = reserve.copyWith(reservationDate: reserveDate);
    reserve = reserve.copyWith(numberOfGuests: numberGuests);
    return reserve;
  }

  DateTime checkPredicate(Set<String> unselectableDates) {
    int days = 0;
    DateTime today = DateTime.now();
    String sanitized = sanitizeDateTime(today);
    bool value = unselectableDates.contains(sanitized);
    while (value) {
      DateTime newDay = today.add(Duration(days: days));
      sanitized = sanitizeDateTime(newDay);
      value = unselectableDates.contains(sanitized);
      days++;
    }
    return today.add(Duration(days: days - 1));
  }
}
