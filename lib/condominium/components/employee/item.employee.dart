import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/employee/domain/entity/employee.entity.dart';

class ItemEmployee extends StatefulWidget {
  final EmployeeEntity employee;
  const ItemEmployee({super.key, required this.employee});

  @override
  State<ItemEmployee> createState() => _ItemEmployeeState();
}

class _ItemEmployeeState extends State<ItemEmployee> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // showDialog(
        //     context: context,
        //     builder: (_) {
        //       return DetailsVisitorDialog(
        //         visitor: widget.employee,
        //         index: widget.index,
        //       );
        //     });
      },
      horizontalTitleGap: 18,
      contentPadding:
          const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
      trailing: Container(
          width: 60,
          alignment: Alignment.centerRight,
          child: const Icon(
            Icons.person,
            color: Colors.greenAccent,
            size: 20,
          )),
      title: Text(
        widget.employee.name,
        style: const TextStyle(fontSize: 13),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Função: ${widget.employee.function.name}',
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
