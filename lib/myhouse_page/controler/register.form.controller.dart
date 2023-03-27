import 'package:flutter/material.dart';

class RegisterFormController {
  final VoidCallback refresh;
  final formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? cpf;
  String? phone;
  String? borndate;

  RegisterFormController(this.refresh);

  String? validateName(String? name) =>
      name!.isNotEmpty ? null : 'Nome Inválido';

  String? validateEmail(String? email) =>
      email!.isNotEmpty ? null : 'Email inválido';

  String? validatePhone(String? phone) =>
      phone!.isNotEmpty ? null : 'Phone inválido';

  String? validateCpf(String? cpf) => cpf!.isNotEmpty ? null : 'Cpf inválido';

  String? validateBornDate(String? bornDate) =>
      bornDate!.isNotEmpty ? null : 'Inválido Data';

  bool validate({required GlobalKey<FormState> formKey}) {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
