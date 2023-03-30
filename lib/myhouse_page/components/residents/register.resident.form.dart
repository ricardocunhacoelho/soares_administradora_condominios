import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/controler/register.form.controller.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/models/myhouse.model.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';
import '../../bloc/myhouse.bloc.dart';

class RegisterResidentForm extends StatefulWidget {
  const RegisterResidentForm({super.key});

  @override
  State<RegisterResidentForm> createState() => _RegisterResidentFormState();
}

class _RegisterResidentFormState extends State<RegisterResidentForm> {
  register(ResidentEntity resident) {
    context.read<MyHouseBloc>().add(RegisterResidentMyHouseEvent(resident));
  }

  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerCpf = TextEditingController();
  final _controllerBornDate = TextEditingController();

  late final RegisterFormController _registerFormController =
      RegisterFormController(() {
    setState(() {});
  }, register);

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
        mask: '##/##/####',
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

  Color color = kDarkBlue;

  @override
  Widget build(BuildContext context) {
    final myHouseBloc = context.watch<MyHouseBloc>();
    final myHouseState = myHouseBloc.state;

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
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                color: kGrey,
              ),
              child: _registerFormController.image == null
                  ? Center(
                      child: IconButton(
                          onPressed: () {
                            _registerFormController.getImage();
                          },
                          icon: Icon(Icons.add_a_photo)),
                    )
                  : Image.file(
                      _registerFormController.image!,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(height: 20),
               Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                 child: Center(
                   child: Text(
                      'É obrigatório entrar com uma foto do morador para reconhecimento',
                      style: kPoppinsMedium.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        color: color,
                      ),
                      textAlign: TextAlign.center,
                      ),
                 ),
               ),
           
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _registerFormController.formKey,
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
                    //space
                    SizedBox(height: 15),

                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange),
                        ),
                        onPressed: () {
                          if (_registerFormController.image != null) {
                            final isValid = _registerFormController.validate(
                                formKey: _registerFormController.formKey);
                            if (isValid) {
                              print('valido');
                              if (myHouseState
                                  is CompleteFetchHomeUnitMyHouseState) {
                                _registerFormController.finalizeUpload(
                                    myHouseState.homeUnitEntity);
                              }
                            } else {
                              print('formValido nao valido');
                            }
                          }else{
                            setState(() {
                              color = Colors.redAccent;
                            });
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Confirmar',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
