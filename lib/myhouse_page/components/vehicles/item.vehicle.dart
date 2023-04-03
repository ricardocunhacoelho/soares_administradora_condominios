import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';

import '../../../app.style.dart';

class ItemVehicle extends StatefulWidget {
  final VehicleEntity vehicleEntity;
  final int index;
  const ItemVehicle(
      {super.key, required this.vehicleEntity, required this.index});

  @override
  State<ItemVehicle> createState() => _ItemVehicleState();
}

class _ItemVehicleState extends State<ItemVehicle> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 18,
      contentPadding:
          const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
      trailing: Container(
        width: 60,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.car_rental,
          color: Colors.greenAccent,
          size: 17,
        ),
      ),
      title: Text(
        widget.vehicleEntity.plate,
        style: const TextStyle(fontSize: 13),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tel. ${widget.vehicleEntity.model} - ${widget.vehicleEntity.year}',
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            'Email ${widget.vehicleEntity.color}',
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
