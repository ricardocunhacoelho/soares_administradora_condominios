import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.task.condominium.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/calendar_condominium/controller/calendar.controller.dart';
import 'package:soares_administradora_condominios/condominium/components/calendar_condominium/horizontal.scheduled.days.dart';
import 'package:soares_administradora_condominios/condominium/components/calendar_condominium/list.task.condominium.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

import '../../app.style.dart';
import '../../size.config.dart';

class CalendarCondominiumPage extends StatefulWidget {
  const CalendarCondominiumPage({super.key});

  @override
  State<CalendarCondominiumPage> createState() =>
      _CalendarCondominiumPageState();
}

class _CalendarCondominiumPageState extends State<CalendarCondominiumPage> {
  late final CalendarController _controllerCalendar = CalendarController(() {
    setState(() {});
  });
  @override
  Widget build(BuildContext context) {
    final fetchTaskCondominiumBloc = context.watch<GetTaskCondominiumBloc>();
    final fetchTaskCondominiumState = fetchTaskCondominiumBloc.state;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.navigate_before,
                color: kDarkGrey,
                size: SizeConfig.blockSizeHorizontal! * 7.5,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        backgroundColor: kLightWhite,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.help_center,
              color: kDarkGrey,
              size: SizeConfig.blockSizeHorizontal! * 7.5,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: kLightWhite,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            //TITULO
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Text('Calendário Condomínio',
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: kDarkBlue)),
            ),
            //LOADING
            if (fetchTaskCondominiumState is LoadingGetTaskCondominiumState)
              const Center(
                child: CircularProgressIndicator(),
              ),
            //COMPLETE GET TASK
            if (fetchTaskCondominiumState is CompleteGetTaskCondominiumState)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(_controllerCalendar.today(),style: kPoppinsBold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        color: kDarkGrey)),
                  ),
                  const SizedBox(height: 10),
                  HorizontalScheduledDays(
                      controllerCalendar: _controllerCalendar),
                  const SizedBox(height: 20),
                  SingleChildScrollView(child: ListTaskCondominium(controllerCalendar: _controllerCalendar)),
                ],
              ),
            //ERROR
            if (fetchTaskCondominiumState is ErrorGetTaskCondominiumState)
              Center(
                child: IconButton(
                    onPressed: () async {
                      // final uid =
                      //     FirebaseAuth.instance.currentUser!.uid.toString();
                      // context.read<LoginBloc>().add(FetchUserLoginEvent(uid));
                      // if (loginstate is CompleteFetchUserResidentLoginState) {
                      //   context.read<FetchUnitBloc>().add(
                      //       FetchHomeUnitFetchEvents(
                      //           loginstate.resident.homeUnitEntity));
                      // }
                    },
                    icon: const Icon(Icons.refresh)),
              ),
          ],
        ),
      ),
    );
  }
}
