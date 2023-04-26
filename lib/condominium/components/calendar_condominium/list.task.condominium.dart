import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/entity/task.condominium.entity.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.task.condominium.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/calendar_condominium/controller/calendar.controller.dart';
import 'package:soares_administradora_condominios/condominium/components/calendar_condominium/item.task.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class ListTaskCondominium extends StatefulWidget {
  final CalendarController controllerCalendar;

  const ListTaskCondominium({super.key, required this.controllerCalendar});

  @override
  State<ListTaskCondominium> createState() => _ListTaskCondominiumState();
}

class _ListTaskCondominiumState extends State<ListTaskCondominium> {
  List<TaskCondominiumEntity> taskListToday = [];
  List<TaskCondominiumEntity> taskListDayAfter = [];

  @override
  Widget build(BuildContext context) {
    final fetchTaskCondominiumBloc = context.watch<GetTaskCondominiumBloc>();
    final fetchTaskCondominiumState = fetchTaskCondominiumBloc.state;

    if (fetchTaskCondominiumState is CompleteGetTaskCondominiumState) {
      final listTask = fetchTaskCondominiumState.taskList;
      taskListToday = widget.controllerCalendar.generateListTaskToday(listTask);
      taskListDayAfter =
          widget.controllerCalendar.generateListTaskDayAfter(listTask);
    }

    return Column(
      children: [
        if (fetchTaskCondominiumState is CompleteGetTaskCondominiumState)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              taskListToday.isNotEmpty
                  ? ListView.builder(
                      itemCount: taskListToday.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        final task = taskListToday[index];
                        final progress = task.endTaskDate != null &&
                            widget.controllerCalendar
                                .dateOnly(task.startTaskDate)
                                .isBefore(widget.controllerCalendar.dateOnly(
                                    widget.controllerCalendar.daySelected)) &&
                            (widget.controllerCalendar
                                    .dateOnly(task.endTaskDate!)
                                    .isAfter(widget.controllerCalendar.dateOnly(
                                        widget
                                            .controllerCalendar.daySelected)) ||
                                (DateUtils.isSameDay(task.endTaskDate!,
                                    widget.controllerCalendar.daySelected)));

                        return ItemTaskCondominium(task, false, progress, null);
                      })
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          'Não há tarefas no calendario do condominio para hoje',
                          style: kPoppinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: kDarkBlue)),
                    ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Para os próximos dias',
                    style: kPoppinsBold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        color: kDarkBlue)),
              ),
              const SizedBox(height: 15),
              taskListDayAfter.isNotEmpty
                  ? ListView.builder(
                      itemCount: taskListDayAfter.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        final task = taskListDayAfter[index];
                        final alreadyStarted =
                            taskListToday.contains(taskListDayAfter[index]);
                        return ItemTaskCondominium(
                            task, true, null, alreadyStarted);
                      })
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          'Não há tarefas no calendario do condominio para os próximos dias',
                          style: kPoppinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: kDarkBlue)),
                    ),
            ],
          ),
        if (fetchTaskCondominiumState is LoadingGetTaskCondominiumState)
          const Center(child: CircularProgressIndicator()),
        if (fetchTaskCondominiumState is ErrorGetTaskCondominiumState)
          Center(
            child: Text('Erro ${fetchTaskCondominiumState.message}'),
          )
      ],
    );
  }
}
