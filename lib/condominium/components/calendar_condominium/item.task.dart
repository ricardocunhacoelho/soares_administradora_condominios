import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/entity/task.condominium.entity.dart';
import 'package:soares_administradora_condominios/app.style.dart';

class ItemTaskCondominium extends StatelessWidget {
  final TaskCondominiumEntity task;
  final bool dayAfter;
  final bool? progress;
  final bool? alreadyStarted;
  ItemTaskCondominium(
      this.task, this.dayAfter, this.progress, this.alreadyStarted);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: dayAfter
              ? alreadyStarted != null && alreadyStarted!
                  ? Colors.purpleAccent
                  : kGrey
              : progress != null && progress!
                  ? kBlue
                  : Colors.orangeAccent,
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                if (alreadyStarted == null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.grey[200],
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "inicio: ${DateFormat('dd-MM-yyyy').format(task.startTaskDate)}",
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(fontSize: 13, color: Colors.grey[100]),
                        ),
                      ),
                    ],
                  ),
                if (task.endTaskDate != null)
                  Row(
                    children: [
                      if (alreadyStarted != null)
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: Colors.grey[200],
                              size: 18,
                            ),
                            SizedBox(width: 4),
                          ],
                        ),
                      Text(
                        "termino em: ${DateFormat('dd-MM-yyyy').format(task.endTaskDate!)}",
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(fontSize: 15, color: Colors.grey[100]),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 12),
                Text(
                  task.details,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 15, color: Colors.grey[100]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              dayAfter
                  ? alreadyStarted != null && alreadyStarted!
                      ? "INICIADO"
                      : "PENDENTE"
                  : progress!
                      ? "EM ANDAMENTO"
                      : task.endTaskDate == null ? "HOJE" : "INICIO HOJE",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
