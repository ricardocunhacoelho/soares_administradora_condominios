import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/reserve.entity.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/reserves/shared.qr.reserve.dart';

import '../../../../app.style.dart';

class ItemReserve extends StatefulWidget {
  final ReserveEntity reserve;

  const ItemReserve({
    super.key,
    required this.reserve,
  });

  @override
  State<ItemReserve> createState() => _ItemReserveState();
}

class _ItemReserveState extends State<ItemReserve> {
  DateTime dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(
            context: context,
            builder: (_) {
              return ForShareQrReserveDialog(
                reserve: widget.reserve,
              );
            });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 12),
        child: Container(
          padding: EdgeInsets.all(16),
          //  width: SizeConfig.screenWidth * 0.78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kGrey,
          ),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.reserve.areaCondominium.title,
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
                        "Data reservada: ${DateFormat('dd-MM-yyyy').format(widget.reserve.reservationDate)}",
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(fontSize: 13, color: Colors.grey[100]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    widget.reserve.motivation,
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
              child: QrImage(
                data: widget.reserve.id,
                size: 50,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
