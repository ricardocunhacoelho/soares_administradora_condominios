import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.employee.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.lost.found.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.news.wall.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.polling.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.task.condominium.bloc.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';

import '../../app.style.dart';
import '../../size.config.dart';

Widget itemInformationButtonCondominium(
  String image,
  String nome,
  int index,
  String route,
  BuildContext context,
) {
  return GestureDetector(
    onTap: () {
      if (route == '/newsWallPage') {
        context.read<GetNewsWallBloc>().add(GetNewsWallEvent());
      }
      if (route == '/calendarCondominiumPage') {
        context
            .read<GetTaskCondominiumBloc>()
            .add(GetAllTaskCondominiumEvent());
      }
      if (route == '/lostFoundPage') {
        context.read<GetLostFoundBloc>().add(GetAllLostFoundEvent());
      }
      if (route == '/employeePage') {
        context.read<GetEmployeeBloc>().add(GetAllEmployeeEvent());
      }
      if (route == '/pollingPage') {
        context.read<GetPollingBloc>().add(GetAllPollingEvent());
      }
      Navigator.pushNamed(context, route);
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(13),
          width: SizeConfig.blockSizeHorizontal! * 13,
          height: SizeConfig.blockSizeHorizontal! * 13,
          margin: index == 4
              ? const EdgeInsets.only(right: 20)
              : index == 0
                  ? const EdgeInsets.only(left: 25, right: 20)
                  : const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: new Offset(1.0, 1.0),
                blurRadius: 5,
                color: kDarkBlue.withOpacity(0.051),
                spreadRadius: 2,
              )
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(
                67,
              ),
            ),
          ),
          child: ImageIcon(
            AssetImage(image),
            color: kDarkBlue,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.topLeft,
          height: 30,
          width: 95,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                margin: index == 4
                    ? const EdgeInsets.only(right: 20)
                    : index == 0
                        ? const EdgeInsets.only(left: 25, right: 20)
                        : const EdgeInsets.only(right: 20),
                child: Text(
                  nome,
                  style: kDoppio_One.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      color: kDarkBlue),
                  textAlign: TextAlign.center,
                ),
              )),
            ],
          ),
        )
      ],
    ),
  );
}
