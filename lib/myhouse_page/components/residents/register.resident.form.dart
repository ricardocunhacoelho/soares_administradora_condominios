import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/myhouse.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/controler/register.form.controller.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class RegisterResidentForm extends StatefulWidget {
  const RegisterResidentForm({super.key});

  @override
  State<RegisterResidentForm> createState() => _RegisterResidentFormState();
}

class _RegisterResidentFormState extends State<RegisterResidentForm> {
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerCpf = TextEditingController();
  final _controllerBornDate = TextEditingController();

  late final RegisterFormController _registerFormController =
      RegisterFormController(
    () {
      setState(() {});
    },
  );

  Widget fieldName() {
    return TextFormField(
      onSaved: (newValue) => _registerFormController.name = newValue,
      validator: (value) =>
          _registerFormController.validateName(_controllerName.text),
      controller: _controllerName,
      decoration: const InputDecoration(
        label: Text('Nome Completo'),
      ),
    );
  }

  Widget fieldEmail() {
    return TextFormField(
      onSaved: (newValue) => _registerFormController.email = newValue,
      validator: (value) =>
          _registerFormController.validateEmail(_controllerEmail.text),
      controller: _controllerEmail,
      decoration: const InputDecoration(
          label: Text('Email'), hintText: 'exemplo@gmail.com'),
    );
  }

  Widget fieldPhoneNumber() {
    MaskTextInputFormatter maskFormatterPhone = MaskTextInputFormatter(
        mask: '(##) # ####-####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return TextFormField(
      onSaved: (newValue) => _registerFormController.phone = newValue,
      validator: (value) =>
          _registerFormController.validatePhone(_controllerPhone.text),
      controller: _controllerPhone,
      inputFormatters: [maskFormatterPhone],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          label: Text('Celular'), hintText: '(99) 9 9999-9999'),
    );
  }

  Widget fieldCpf() {
    MaskTextInputFormatter maskFormatterCPF = MaskTextInputFormatter(
        mask: '###.###.###-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return TextFormField(
      onSaved: (newValue) => _registerFormController.cpf = newValue,
      validator: (value) =>
          _registerFormController.validateCpf(_controllerCpf.text),
      controller: _controllerCpf,
      inputFormatters: [maskFormatterCPF],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text('CPF'),
      ),
    );
  }

  Widget fieldBornDate() {
    MaskTextInputFormatter maskFormatterBornDate = MaskTextInputFormatter(
        mask: '##-##-####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return TextFormField(
      onSaved: (newValue) => _registerFormController.borndate = newValue,
      validator: (value) =>
          _registerFormController.validateBornDate(_controllerBornDate.text),
      controller: _controllerBornDate,
      inputFormatters: [maskFormatterBornDate],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          label: Text('Dat. Nasc.'), hintText: '21/04/2021'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.close_rounded,
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
      ),
      backgroundColor: kLightWhite,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _registerFormController.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //NAME FIELD
                  fieldName(),
                  //space
                  SizedBox(height: 15),
                  fieldEmail(),
                  //space
                  SizedBox(height: 15),
                  fieldPhoneNumber(),
                  //space
                  SizedBox(height: 15),
                  fieldCpf(),
                  //space
                  SizedBox(height: 15),
                  fieldBornDate(),
                  SizedBox(height: 15),

                  TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                      onPressed: () {
                        final isValid = _registerFormController.validate(
                            formKey: _registerFormController.formKey);
                        if (isValid) {
                          // context
                          //     .read<MyHouseBloc>()
                          //     .add(RegisterResidentMyHouseEvent());
                        } else {
                          print('formValido nao valido');
                        }
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            )),
      )),
    );
  }
}
