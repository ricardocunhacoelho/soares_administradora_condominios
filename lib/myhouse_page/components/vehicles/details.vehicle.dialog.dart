import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/vehicles/delete.vehicle.dialog.dart';
import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class DetailsVehicleDialog extends StatefulWidget {
  final VehicleEntity vehicle;
  final int index;
  final String idUnit;

  const DetailsVehicleDialog(
      {super.key,
      required this.idUnit,
      required this.vehicle,
      required this.index});
  @override
  _DetailsVehicleDialogState createState() => new _DetailsVehicleDialogState();
}

class _DetailsVehicleDialogState extends State<DetailsVehicleDialog> {
  finishDelete() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final myHouseBloc = context.watch<MyHouseBloc>();
    final myHouseState = myHouseBloc.state;

    return AlertDialog(
      actionsPadding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.vehicle.vehicleType == EVehicleType.car ? 'Carro' : 'Moto',
              style: kPoppinsMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                color: kDarkBlue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Text(
              'Placa: ${widget.vehicle.plate}',
              style: kPoppinsMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                color: kDarkBlue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Text(
              'Modelo: ${widget.vehicle.model} - ${widget.vehicle.year}',
              style: kPoppinsMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                color: kDarkBlue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Text(
              'Cor: ${widget.vehicle.color}',
              style: kPoppinsMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                color: kDarkBlue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 25),
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                color: kGrey,
              ),
              child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return DeleteVehicleDialog(
                              idUnit: widget.idUnit,
                              vehicle: widget.vehicle,
                              index: widget.index,
                              finishDelete : finishDelete,
                              );
                        });
                  },
                  child: Text(
                    'Remover esse veículo',
                    style: kPoppinsSemiBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      color: kLightWhite,
                    ),
                  )),
            )
          ],
        ),
      ),
      actions: [
        Container(
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: kGrey,
          ),
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Voltar',
                  style: kPoppinsSemiBold.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    color: kLightWhite,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
