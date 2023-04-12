import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/events/login.events.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/visitors/add.picture.visitor.dialog.dart';
import 'package:soares_administradora_condominios/myhouse_page/controler/visitor.controller.register.form.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';
import '../../bloc/myhouse.bloc.dart';

class RegisterVisitorForm extends StatefulWidget {
  const RegisterVisitorForm({super.key});

  @override
  State<RegisterVisitorForm> createState() => _RegisterVisitorFormState();
}

class _RegisterVisitorFormState extends State<RegisterVisitorForm> {
  register(VisitorEntity visitor) {
    context.read<MyHouseBloc>().add(RegisterVisitorMyHouseEvent(visitor));
  }

  final _controllerName = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerCpf = TextEditingController();
  final _controllerBornDate = TextEditingController();
  final _controllerFinishaccessDate = TextEditingController();
  final _controllerStartTimeAccessDay = TextEditingController();
  final _controllerEndTimeAccessDay = TextEditingController();

  late final VisitorControllerRegister _registerFormController =
      VisitorControllerRegister(() {
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

  Widget fieldFinishaccessDate() {
    return TextField(
      enabled: _registerFormController.freePass ? false : true,
      controller: _controllerFinishaccessDate,
      keyboardType: TextInputType.none,
      decoration: const InputDecoration(
          icon: Icon(Icons.punch_clock_rounded),
          labelText: "Data para expirar acesso ao condominio"),
      onTap: _registerFormController.freePass
          ? null
          : () async {
              DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));
              if (pickeddate != null) {
                setState(() {
                  _controllerFinishaccessDate.text =
                      DateFormat('dd-MM-yyyy').format(pickeddate);
                  _registerFormController.finishaccessDate = pickeddate;
                });
              }
            },
    );
  }

  Widget fieldStartTimeAccessDay() {
    return TextField(
      enabled: _registerFormController.freePass ? false : true,
      controller: _controllerStartTimeAccessDay,
      keyboardType: TextInputType.none,
      decoration: const InputDecoration(
          icon: Icon(Icons.punch_clock_rounded),
          labelText: "Entrada a partir de: "),
      onTap: _registerFormController.freePass
          ? null
          : () async {
              TimeOfDay? _picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: 23, minute: 15));
              if (_picked != null) {
                setState(() {
                  _controllerStartTimeAccessDay.text =
                      _picked.hour.toString().padLeft(2, '0') +
                          ':' +
                          _picked.minute.toString().padLeft(2, '0');
                  _registerFormController.startTimeAccessDay = _picked;
                });
              }
            },
    );
  }

  Widget fieldEndTimeAccessDay() {
    return TextField(
      enabled: _registerFormController.freePass ? false : true,
      controller: _controllerEndTimeAccessDay,
      keyboardType: TextInputType.none,
      decoration: const InputDecoration(
          icon: Icon(Icons.punch_clock_rounded), labelText: "até: "),
      onTap: _registerFormController.freePass
          ? null
          : () async {
              TimeOfDay? _picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: 23, minute: 15));
              if (_picked != null) {
                setState(() {
                  _controllerEndTimeAccessDay.text =
                      _picked.hour.toString().padLeft(2, '0') +
                          ':' +
                          _picked.minute.toString();
                  _registerFormController.endTimeAccessDay = _picked;
                });
              }
            },
    );
  }

  @override
  Widget build(BuildContext context) {
    final fetchBloc = context.watch<FetchUnitBloc>();
    final fetchState = fetchBloc.state;
    final loginBloc = context.watch<LoginBloc>();
    final loginState = loginBloc.state;

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
        child: _registerFormController.loadingFinish
            ? const SizedBox(
                child: Center(
                child: CircularProgressIndicator(),
              ))
            : _registerFormController.finish
                ? Padding(
                    padding:
                        const EdgeInsets.only(bottom: 30, right: 20, left: 20),
                    child: Column(children: [
                      Text(
                        'Agradecemos o cadastro!',
                        style: kPoppinsSemiBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          color: Colors.orangeAccent,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Basta que o visitante apresente o QRCODE gerado na portaria junto ao cpf e documento com foto.',
                        style: kPoppinsMedium.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                          color: kDarkBlue,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.black12,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nome completo: ${_registerFormController.name}',
                              style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                color: kDarkBlue,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Telefone: ${_registerFormController.phone}',
                              style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                color: kDarkBlue,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'CPF: ${_registerFormController.cpf}',
                              style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                color: kDarkBlue,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Data de nascimento: ${_registerFormController.borndate}',
                              style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                color: kDarkBlue,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 25),
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: kLighterBlue,
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                  boxShadow: [
                                    BoxShadow(
                                        color: kDarkBlue.withOpacity(0.051),
                                        offset: const Offset(0.0, 3.0),
                                        blurRadius: 24.0,
                                        spreadRadius: 0.0)
                                  ]),
                              child: _registerFormController.image == null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 70,
                                            height: 70,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/portrait.png'),
                                                  fit: BoxFit.contain),
                                            )),
                                      ],
                                    )
                                  : Image.file(
                                      _registerFormController.image!,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AddPictureVisitorDialog(
                                      controller: _registerFormController);
                                });
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: kLighterBlue,
                                    borderRadius:
                                        BorderRadius.circular(kBorderRadius),
                                    boxShadow: [
                                      BoxShadow(
                                          color: kDarkBlue.withOpacity(0.051),
                                          offset: const Offset(0.0, 3.0),
                                          blurRadius: 24.0,
                                          spreadRadius: 0.0)
                                    ]),
                                child: _registerFormController.image == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: 70,
                                              height: 70,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/portrait.png'),
                                                    fit: BoxFit.contain),
                                              )),
                                        ],
                                      )
                                    : Image.file(
                                        _registerFormController.image!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              if (_registerFormController.image != null)
                                Positioned(
                                    bottom: 15,
                                    right: 15,
                                    child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: kLightWhite,
                                            borderRadius: BorderRadius.circular(
                                                kBorderRadius),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: kDarkBlue
                                                      .withOpacity(0.051),
                                                  offset:
                                                      const Offset(0.0, 3.0),
                                                  blurRadius: 24.0,
                                                  spreadRadius: 0.0)
                                            ]),
                                        child: Icon(Icons.edit)))
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Center(
                            child: Text(
                              'Você pode acrescentar a foto mais tarde. Após anexar uma foto o QRCODE será suficiente na portaria (não é necessário apresentar documento).',
                              style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                color: kDarkBlue,
                              ),
                              textAlign: TextAlign.justify,
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
                                //PHONE FIELD
                                fieldPhoneNumber(),
                                //space
                                SizedBox(height: 15),
                                //CPF FIELD
                                fieldCpf(),
                                //space
                                SizedBox(height: 15),
                                //BORN FIELD
                                fieldBornDate(),
                                //space
                                SizedBox(height: 30),
                                Container(
                                  color: Colors.black12,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          top: 20,
                                          right: 20,
                                        ),
                                        child: Text(
                                          'Este visitante é um familiar próximo? habilitar acesso à qualquer dia/hora utilizando QRCODE (Marque abaixo).',
                                          style: kPoppinsMedium.copyWith(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                4,
                                            color: kDarkBlue,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Checkbox(
                                        value: _registerFormController.freePass,
                                        onChanged: (value) => setState(() {
                                          if (value!) {
                                            _controllerFinishaccessDate.text =
                                                '';
                                            _controllerStartTimeAccessDay.text =
                                                '';
                                            _controllerEndTimeAccessDay.text =
                                                '';
                                          }
                                          _registerFormController
                                              .changeFreepass(value);
                                        }),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            if (!_registerFormController
                                                .freePass)
                                              Text(
                                                'Defina uma data para expirar o acesso do visitante ao condomínio (você pode extender esta data depois)',
                                                style: kPoppinsMedium.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      4,
                                                  color: kDarkBlue,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            fieldFinishaccessDate(),
                                            const SizedBox(height: 15),
                                            if (!_registerFormController
                                                .freePass)
                                              Text(
                                                'Defina um horário de acesso liberado durante o dia.',
                                                style: kPoppinsMedium.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      4,
                                                  color: kDarkBlue,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            fieldStartTimeAccessDay(),
                                            const SizedBox(height: 10),
                                            fieldEndTimeAccessDay()
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  width: 200,
                                  child: TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(kBlue),
                                      ),
                                      onPressed: () async {
                                        if (_registerFormController.image !=
                                            null) {
                                          final isValid =
                                              _registerFormController.validate(
                                                  formKey:
                                                      _registerFormController
                                                          .formKey);
                                          if (isValid) {
                                            setState(() {
                                              _registerFormController
                                                  .loadingFinish = true;
                                            });
                                            if (fetchState
                                                is CompleteFetchHomeUnitFetchStates) {
                                              _registerFormController
                                                  .finalizeUpload(fetchState
                                                      .homeUnitEntity);
                                            }
                                            await Future.delayed(
                                                const Duration(seconds: 3));
                                            setState(() {
                                              _registerFormController.finish =
                                                  true;
                                              _registerFormController
                                                  .loadingFinish = false;
                                            });
                                          } else {
                                            print('formValido nao valido');
                                          }
                                        } else {
                                          final isValid =
                                              _registerFormController.validate(
                                                  formKey:
                                                      _registerFormController
                                                          .formKey);
                                          if (isValid) {
                                            setState(() {
                                              _registerFormController
                                                  .loadingFinish = true;
                                            });
                                            if (fetchState
                                                is CompleteFetchHomeUnitFetchStates) {
                                              var visitor =
                                                  _registerFormController
                                                      .generateVisitorForm(
                                                          fetchState
                                                              .homeUnitEntity,
                                                          null);
                                              _registerFormController
                                                  .register(visitor);
                                              await Future.delayed(
                                                  const Duration(seconds: 3));
                                              setState(() {
                                                _registerFormController.finish =
                                                    true;
                                                _registerFormController
                                                    .loadingFinish = false;
                                              });
                                            } else {
                                              if (loginState
                                                  is CompleteFetchUserResidentLoginState) {
                                                context.read<FetchUnitBloc>().add(
                                                    FetchHomeUnitFetchEvents(
                                                        loginState.resident
                                                            .homeUnitEntity));
                                              } else {
                                                final uid = FirebaseAuth
                                                    .instance.currentUser!.uid
                                                    .toString();
                                                context.read<LoginBloc>().add(
                                                    FetchUserLoginEvent(uid));
                                              }
                                            }
                                          } else {
                                            print('formValido nao valido');
                                          }
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          'Confirmar',
                                          style: kPoppinsSemiBold.copyWith(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                4.5,
                                            color: kLightWhite,
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      )),
    );
  }
}
