import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/myhouse_page/models/vehicle.model.dart';

class RegisterVehicleFormController {
  final VoidCallback refresh;
  final formKey = GlobalKey<FormState>();
  String? plate;
  String? model;
  int? year;
  String? color;
  bool loadingFinish = false;
  bool finish = false;

  RegisterVehicleFormController(this.refresh);

  String? validatePlate(String? plate) =>
      plate!.isNotEmpty ? null : 'Placa Inválido, por favor confira.';

  String? validateModel(String? model) =>
      model!.isNotEmpty ? null : 'Modelo Inválido, por favor confira.';

  String? validateColor(String? color) =>
      color!.isNotEmpty ? null : 'Cor inválida';

  String? validatePhone(String? phone) =>
      phone!.isNotEmpty && phone.length == 16 ? null : 'Phone inválido';

  String? validateYear(int? year) =>
      year! != null && year <= DateTime.now().year && year >= 1886
          ? null
          : 'Ano do carro inválido, por favor confira.';

  bool validate({required GlobalKey<FormState> formKey}) {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  VehicleModel generateVehicleForm() {
    var vehicle = VehicleModel.empty();
    vehicle = vehicle.copyWith(id: '${plate}${model}');
    vehicle = vehicle.copyWith(plate: plate);
    vehicle = vehicle.copyWith(model: model);
    vehicle = vehicle.copyWith(color: color);
    vehicle = vehicle.copyWith(year: year);
    return vehicle;
  }
}
