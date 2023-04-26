import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/entity/task.condominium.entity.dart';

class CalendarController {
  final VoidCallback refresh;
  List<DateTime> listTaskDate = [DateTime.now()];
  List<String> monthPT = [
    'Jan',
    'Fev',
    'Mar',
    'Abr',
    'Mai',
    'Jun',
    'Jul',
    'Ago',
    'Set',
    'Out',
    'Nov',
    'Dez'
  ];
  List<String> monthPTFullName = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];
  DateTime daySelected = DateTime.now();

  CalendarController(this.refresh);

  List<DateTime> generateListTaskDate(List<TaskCondominiumEntity> tasks) {
    List<DateTime> listTaskDate = [];
    List<String> listTaskDateExtense = [];
    final dayNow = DateTime.now();
    tasks.forEach((element) {
      if (dateOnly(element.startTaskDate).compareTo(dateOnly(dayNow)) == 1 &&
          (DateFormat('dd-MM-yyyy').format(element.startTaskDate) !=
              DateFormat('dd-MM-yyyy').format(dayNow))) {
        listTaskDateExtense
            .add(DateFormat('dd-MM-yyyy').format(element.startTaskDate));
        listTaskDate.add(element.startTaskDate);
      }
      if ((element.endTaskDate != null) &&
          (element.endTaskDate!.isAfter(dayNow)) &&
          !listTaskDateExtense.contains(
              DateFormat('dd-MM-yyyy').format(element.endTaskDate!))) {
        listTaskDateExtense
            .add(DateFormat('dd-MM-yyyy').format(element.endTaskDate!));
        listTaskDate.add(element.endTaskDate!);
      }
    });
    return listTaskDate;
  }

  List<TaskCondominiumEntity> generateListTaskToday(
      List<TaskCondominiumEntity> tasks) {
    List<TaskCondominiumEntity> listTask = [];
    tasks.forEach((element) {
      if ((DateUtils.isSameDay(element.startTaskDate, daySelected)) ||
          (element.endTaskDate != null &&
              (dateOnly(element.endTaskDate!).isAfter(dateOnly(daySelected)) ||
                  element.endTaskDate!.day == daySelected.day &&
                      element.endTaskDate!.month == daySelected.month &&
                      element.endTaskDate!.year == daySelected.year) &&
              element.startTaskDate.isBefore(daySelected))) {
        listTask.add(element);
      }
    });
    listTask.sort((a, b) => a.startTaskDate.isBefore(b.startTaskDate) ? 1 : -1);

    return listTask;
  }

  List<TaskCondominiumEntity> generateListTaskDayAfter(
      List<TaskCondominiumEntity> tasks) {
    List<TaskCondominiumEntity> listTask = [];
    tasks.forEach((element) {
      if ((dateOnly(element.startTaskDate).isAfter(dateOnly(daySelected))) ||
          (element.endTaskDate != null &&
              (dateOnly(element.startTaskDate)
                      .compareTo(dateOnly(daySelected)) !=
                  0) &&
              dateOnly(element.endTaskDate!).isAfter(dateOnly(daySelected)))) {
        listTask.add(element);
      }
    });

    listTask.sort((a, b) => a.startTaskDate.isBefore(b.startTaskDate) ? 1 : -1);

    return listTask;
  }

  DateTime dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  String convertDayOfTheWeekPT(DateTime day) {
    if (DateFormat('EEEE').format(day) == 'Sunday') {
      return 'Dom';
    } else if (DateFormat('EEEE').format(day) == 'Monday') {
      return 'Seg';
    } else if (DateFormat('EEEE').format(day) == 'Tuesday') {
      return 'Ter';
    } else if (DateFormat('EEEE').format(day) == 'Wednesday') {
      return 'Qua';
    } else if (DateFormat('EEEE').format(day) == 'Thursday') {
      return 'Qui';
    } else if (DateFormat('EEEE').format(day) == 'Friday') {
      return 'Sex';
    } else {
      return 'Sab';
    }
  }

  String convertMonthPT(DateTime day) {
    return monthPT[day.month];
  }

  void changeDay(day) {
    daySelected = day;
    refresh();
  }

  String today() {
    return '${monthPTFullName[daySelected.month]} ${daySelected.day}, ${daySelected.year}';
  }
}
