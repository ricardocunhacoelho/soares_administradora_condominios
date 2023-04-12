import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/myhouse_page/models/house.service.provider.model.dart';

class HouseServiceProviderControllerRegister {
  final VoidCallback refresh;
  final Function register;
  final formKey = GlobalKey<FormState>();
  String? name;
  String? cpf;
  String? phone;
  String? borndate;
  bool loadingFinish = false;
  bool finish = false;
  bool permanent = false;
  bool freePass = false;
  TimeOfDay? endOfWorkTimeDay;
  DateTime? finishWorkDate;
  TimeOfDay? workStartTimeDay;
  final values = List.filled(7, false);

  HouseServiceProviderControllerRegister(this.refresh, this.register);

  changePermanent(bool value) {
    permanent = value;
    refresh();
  }

  changeFreepass(bool value) {
    freePass = value;
    refresh();
  }

  selectWeekDays(List values, int day) {
    // Use module % 7 as Sunday's index in the array is 0 and
    // DateTime.sunday constant integer value is 7.
    final index = day % 7;
    // We "flip" the value in this example, but you may also
    // perform validation, a DB write, an HTTP call or anything
    // else before you actually flip the value,
    // it's up to your app's needs.
    values[index] = !values[index];
    print(values);
    refresh();
  }

  String? validateName(String? name) =>
      name!.isNotEmpty ? null : 'Nome Inválido';

  String? validateEmail(String? email) =>
      email!.isNotEmpty ? null : 'Email inválido';

  String? validatePhone(String? phone) =>
      phone!.isNotEmpty && phone.length == 16 ? null : 'Phone inválido';

  String? validateCpf(String? cpf) =>
      cpf!.isNotEmpty && cpf.length == 14 ? null : 'Cpf inválido';

  String? validateBornDate(String? bornDate) =>
      checkDateForm(bornDate!) == true &&
              bornDate.isNotEmpty &&
              bornDate.length == 10
          ? null
          : 'Está data é inválida';

  bool validate({required GlobalKey<FormState> formKey}) {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  HouseServiceProviderModel generateHouseServiceProviderForm(
      HomeUnitEntity homeUnitEntity) {
    var houseServiceProvider = HouseServiceProviderModel.empty();
    DateTime date = generateDateForm(borndate!);
    String cpfUnmasked = generateCpfForm(cpf!);
    houseServiceProvider = houseServiceProvider.copyWith(
        id: '${homeUnitEntity.id}_${cpfUnmasked}');
    houseServiceProvider = houseServiceProvider.copyWith(name: name);
    houseServiceProvider = houseServiceProvider.copyWith(bornDate: date);
    houseServiceProvider = houseServiceProvider.copyWith(cpf: cpfUnmasked);
    houseServiceProvider = houseServiceProvider.copyWith(phoneNumber: phone);
    houseServiceProvider =
        houseServiceProvider.copyWith(unit: homeUnitEntity.unit);
    houseServiceProvider = houseServiceProvider.copyWith(freePass: freePass);
    houseServiceProvider =
        houseServiceProvider.copyWith(recurringService: permanent);
    houseServiceProvider =
        houseServiceProvider.copyWith(startWorkDate: DateTime.now());
    houseServiceProvider =
        houseServiceProvider.copyWith(workStartTimeDay: workStartTimeDay);
    houseServiceProvider =
        houseServiceProvider.copyWith(endOfWorkTimeDay: endOfWorkTimeDay);
    houseServiceProvider =
        houseServiceProvider.copyWith(finishWorkDate: finishWorkDate);
    houseServiceProvider =
        houseServiceProvider.copyWith(daysWeekAccess: values);
    return houseServiceProvider;
  }

  DateTime generateDateForm(String date) {
    List<String> list = date.split('/');

    int? year = int.tryParse(list[2]);
    int? month = int.tryParse(list[1]);
    int? day = int.tryParse(list[0]);
    return DateTime(year!, month!, day!);
  }

  static DateTime lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? new DateTime(month.year, month.month + 1, 1)
        : new DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(new Duration(days: 1));
  }

  bool checkDateForm(String date) {
    List<String> list = date.split('/');
    final now = DateTime.now();
    int? year = int.tryParse(list[2]);
    int? month = int.tryParse(list[1]);
    int? day = int.tryParse(list[0]);
    if (year! > now.year) {
      return false;
    } else if (year < (now.year - 100)) {
      return false;
    } else if (month! > 12) {
      return false;
    } else if (day! > 31) {
      return false;
    } else if (month == 01 && day > lastDayOfMonth(DateTime(2023, 1)).day) {
      return false;
    } else if (month == 02 && day > lastDayOfMonth(DateTime(2023, 2)).day) {
      return false;
    } else if (month == 03 && day > lastDayOfMonth(DateTime(2023, 3)).day) {
      return false;
    } else if (month == 04 && day > lastDayOfMonth(DateTime(2023, 4)).day) {
      return false;
    } else if (month == 05 && day > lastDayOfMonth(DateTime(2023, 5)).day) {
      return false;
    } else if (month == 05 && day > lastDayOfMonth(DateTime(2023, 5)).day) {
      return false;
    } else if (month == 06 && day > lastDayOfMonth(DateTime(2023, 6)).day) {
      return false;
    } else if (month == 07 && day > lastDayOfMonth(DateTime(2023, 7)).day) {
      return false;
    } else if (month == 08 && day > lastDayOfMonth(DateTime(2023, 8)).day) {
      return false;
    } else if (month == 09 && day > lastDayOfMonth(DateTime(2023, 9)).day) {
      return false;
    } else if (month == 10 && day > lastDayOfMonth(DateTime(2023, 10)).day) {
      return false;
    } else if (month == 11 && day > lastDayOfMonth(DateTime(2023, 11)).day) {
      return false;
    } else if (month == 12 && day > lastDayOfMonth(DateTime(2023, 12)).day) {
      return false;
    } else if (month == 00) {
      return false;
    } else if (day == 00) {
      return false;
    } else if (year == 00) {
      return false;
    } else {
      return true;
    }
  }

  String generateCpfForm(String cpf) {
    return cpf.replaceAll(RegExp(r'[.,-]'), "");
  }
}
