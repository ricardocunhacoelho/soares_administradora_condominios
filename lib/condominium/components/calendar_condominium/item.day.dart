import 'package:flutter/material.dart';

import 'package:soares_administradora_condominios/condominium/components/calendar_condominium/controller/calendar.controller.dart';
import 'package:soares_administradora_condominios/size.config.dart';

import '../../../app.style.dart';

class ItemDay extends StatefulWidget {
  final DateTime day;
  final VoidCallback onChangeDay;
  final bool select;
  final CalendarController controllerCalendar;
  final int index;
  final int totalIndex;
  const ItemDay({
    super.key,
    required this.day,
    required this.onChangeDay,
    required this.select,
    required this.controllerCalendar,
    required this.index,
    required this.totalIndex,
  });

  @override
  State<ItemDay> createState() => _ItemDayState();
}

class _ItemDayState extends State<ItemDay> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onChangeDay,
      child: Container(
        width: 80,
        margin: widget.index == widget.totalIndex - 1
            ? const EdgeInsets.only(right: 20)
            : widget.index == 0
                ? const EdgeInsets.only(left: 20, right: 15)
                : const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: widget.select ? kBlue : kWhite,
            boxShadow: [
              BoxShadow(
                  color: kDarkBlue.withOpacity(0.091),
                  offset: const Offset(0.0, 3.0),
                  blurRadius: 24.0,
                  spreadRadius: 0.0)
            ]),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.controllerCalendar.convertMonthPT(widget.day),
              style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  color: widget.select ? kWhite : kDarkBlue),
            ),
            const SizedBox(height: 5),
            Text(
              widget.day.day.toString(),
              style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: widget.select ? kWhite : kDarkBlue),
            ),
            const SizedBox(height: 5),
            Text(
              widget.controllerCalendar.convertDayOfTheWeekPT(widget.day),
              style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: widget.select ? kWhite : kDarkBlue),
            ),
          ],
        ),
      ),
    );
  }
}
