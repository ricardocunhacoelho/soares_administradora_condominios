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
    final dayNow = DateTime.now();
    tasks.forEach((element) {
      if (element.startTaskDate.isAfter(dayNow)) {
        listTaskDate.add(element.startTaskDate);
      }
    });
    return listTaskDate;
  }

  List<TaskCondominiumEntity> generateListTaskToday(
      List<TaskCondominiumEntity> tasks) {
    List<TaskCondominiumEntity> listTask = [];
    tasks.forEach((element) {
      if ((element.startTaskDate.day == daySelected.day &&
              element.startTaskDate.month == daySelected.month &&
              element.startTaskDate.year == daySelected.year) ||
          (element.endTaskDate != null &&
              (element.endTaskDate!.isAfter(daySelected) || element.endTaskDate!.day == daySelected.day &&
              element.endTaskDate!.month == daySelected.month &&
              element.endTaskDate!.year == daySelected.year) && element.startTaskDate.isBefore(daySelected))) {
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
      if (element.startTaskDate.isAfter(daySelected)) {
        listTask.add(element);
      }
    });
    return listTask;
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
