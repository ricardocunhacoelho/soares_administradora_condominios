import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.task.condominium.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/calendar_condominium/controller/calendar.controller.dart';
import 'package:soares_administradora_condominios/condominium/components/calendar_condominium/item.day.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

class HorizontalScheduledDays extends StatefulWidget {
  final CalendarController controllerCalendar;

  const HorizontalScheduledDays({super.key, required this.controllerCalendar});

  @override
  State<HorizontalScheduledDays> createState() =>
      _HorizontalScheduledDaysState();
}

class _HorizontalScheduledDaysState extends State<HorizontalScheduledDays> {
  List<DateTime> taskListDate = [];
  @override
  Widget build(BuildContext context) {
    final fetchTaskCondominiumBloc = context.watch<GetTaskCondominiumBloc>();
    final fetchTaskCondominiumState = fetchTaskCondominiumBloc.state;

    if (fetchTaskCondominiumState is CompleteGetTaskCondominiumState) {
      final listTask = fetchTaskCondominiumState.taskList;
      taskListDate = [
        DateTime.now(),
        ...widget.controllerCalendar.generateListTaskDate(listTask)
      ];
      taskListDate.sort((a, b) => a.isAfter(b) ? 1 : -1);
    }

    return SizedBox(
      width: double.infinity,
      height: 95,
      child: Row(
        children: [
          if (fetchTaskCondominiumState is CompleteGetTaskCondominiumState)
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: taskListDate.length,
                  itemBuilder: (context, index) {
                    final day = taskListDate[index];
                    final bool select =
                        day.day == widget.controllerCalendar.daySelected.day
                            ? true
                            : false;
                    return ItemDay(
                      day: day,
                      select: select,
                      controllerCalendar: widget.controllerCalendar,
                      onChangeDay: () {
                        widget.controllerCalendar.changeDay(day);
                      },
                      index: index,
                      totalIndex: taskListDate.length,
                    );
                  }),
            ),
          if (fetchTaskCondominiumState is LoadingGetTaskCondominiumState)
            const Center(child: CircularProgressIndicator()),
          if (fetchTaskCondominiumState is ErrorGetTaskCondominiumState)
            Center(
              child: Text('Erro ${fetchTaskCondominiumState.message}'),
            )
        ],
      ),
    );
  }
}
