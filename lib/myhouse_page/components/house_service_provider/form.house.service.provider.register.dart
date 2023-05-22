import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/login/bloc/fetch.user.login.bloc.dart';
import 'package:soares_administradora_condominios/login/bloc/login.bloc.dart';
import 'package:soares_administradora_condominios/login/events/login.events.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/controler/house.service.provider.controller.register.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:weekday_selector/weekday_selector.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';
import '../../bloc/myhouse.bloc.dart';

class RegisterHouseServiceProviderForm extends StatefulWidget {
  const RegisterHouseServiceProviderForm({super.key});

  @override
  State<RegisterHouseServiceProviderForm> createState() =>
      _RegisterHouseServiceProviderFormState();
}

class _RegisterHouseServiceProviderFormState
    extends State<RegisterHouseServiceProviderForm> {
  register(HouseServiceProviderEntity houseServiceProvider) {
    context
        .read<MyHouseBloc>()
        .add(RegisterHouseServiceProviderMyHouseEvent(houseServiceProvider));
  }

  final _controllerName = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerCpf = TextEditingController();
  final _controllerBornDate = TextEditingController();
  final _controllerFinishWorkDate = TextEditingController();
  final _controllerWorkStartTimeDay = TextEditingController();
  final _controllerEndOfWorkTimeDay = TextEditingController();

  late final HouseServiceProviderControllerRegister _registerFormController =
      HouseServiceProviderControllerRegister(() {
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

  Widget fieldFinishWorkDate() {
    return TextField(
      enabled:
          _registerFormController.freePass || _registerFormController.permanent
              ? false
              : true,
      controller: _controllerFinishWorkDate,
      keyboardType: TextInputType.none,
      decoration: const InputDecoration(
          icon: Icon(Icons.punch_clock_rounded),
          labelText: "Data para expirar acesso ao condominio"),
      onTap: _registerFormController.permanent
          ? null
          : () async {
              DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));
              if (pickeddate != null) {
                setState(() {
                  _controllerFinishWorkDate.text =
                      DateFormat('dd-MM-yyyy').format(pickeddate);
                  _registerFormController.finishWorkDate = pickeddate;
                });
              }
            },
    );
  }

  Widget fieldWorkStartTimeDay() {
    return TextField(
      enabled: _registerFormController.freePass ? false : true,
      controller: _controllerWorkStartTimeDay,
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
                  _controllerWorkStartTimeDay.text =
                      _picked.hour.toString().padLeft(2, '0') +
                          ':' +
                          _picked.minute.toString().padLeft(2, '0');
                  _registerFormController.workStartTimeDay = _picked;
                });
              }
            },
    );
  }

  Widget fieldEndOfWorkTimeDay() {
    return TextField(
      enabled: _registerFormController.freePass ? false : true,
      controller: _controllerEndOfWorkTimeDay,
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
                  _controllerEndOfWorkTimeDay.text =
                      _picked.hour.toString().padLeft(2, '0') +
                          ':' +
                          _picked.minute.toString().padLeft(2, '0');
                  _registerFormController.endOfWorkTimeDay = _picked;
                });
              }
            },
    );
  }

  @override
  Widget build(BuildContext context) {
    final fetchBloc = context.watch<FetchUnitBloc>();
    final fetchState = fetchBloc.state;
    final fetchUserBloc = context.watch<FetchUserBloc>();
    final fetchUserState = fetchUserBloc.state;

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
                        'Basta que o funcionário apresente o QRCODE gerado junto a um documento com foto na portaria.',
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
                          ],
                        ),
                      ),
                    ]),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: [
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
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Text(
                                              'Livre acesso?',
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
                                            value: _registerFormController
                                                .freePass,
                                            onChanged: (value) => setState(() {
                                              if (value!) {
                                                _controllerFinishWorkDate.text =
                                                    '';
                                                _controllerWorkStartTimeDay
                                                    .text = '';
                                                _controllerEndOfWorkTimeDay
                                                    .text = '';
                                              }
                                              _registerFormController
                                                  .changeFreepass(value);
                                            }),
                                          ),
                                        ],
                                      ),
                                      if (!_registerFormController.freePass)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            top: 20,
                                            right: 20,
                                          ),
                                          child: Text(
                                            'Marque os dias da semana onde o acesso deve ser liberado ao funcionário',
                                            style: kPoppinsMedium.copyWith(
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  4,
                                              color: kDarkBlue,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      const SizedBox(height: 10),
                                      if (!_registerFormController.freePass)
                                        WeekdaySelector(
                                          onChanged: (int day) {
                                            _registerFormController
                                                .selectWeekDays(
                                                    _registerFormController
                                                        .values,
                                                    day);
                                          },
                                          values:
                                              _registerFormController.values,
                                        ),
                                      if (!_registerFormController.freePass)
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Aponte uma janela de horas para acesso liberado dentro do dia.',
                                                style: kPoppinsMedium.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      4,
                                                  color: kDarkBlue,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              fieldWorkStartTimeDay(),
                                              const SizedBox(height: 10),
                                              fieldEndOfWorkTimeDay(),
                                              const SizedBox(height: 20),
                                              Text(
                                                'Defina uma data para expirar o acesso do funcionário ao condomínio',
                                                style: kPoppinsMedium.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      4,
                                                  color: kDarkBlue,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Funcionário permanente ?',
                                                    style:
                                                        kPoppinsMedium.copyWith(
                                                      fontSize: SizeConfig
                                                              .blockSizeHorizontal! *
                                                          4,
                                                      color: kDarkBlue,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  Checkbox(
                                                    value:
                                                        _registerFormController
                                                            .permanent,
                                                    onChanged: (valuePerm) =>
                                                        setState(() {
                                                      if (valuePerm!) {
                                                        _controllerFinishWorkDate
                                                            .text = '';
                                                      }
                                                      _registerFormController
                                                          .changePermanent(
                                                              valuePerm);
                                                    }),
                                                  ),
                                                ],
                                              ),
                                              fieldFinishWorkDate(),
                                              const SizedBox(height: 15),
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
                                        final isValid =
                                            _registerFormController.validate(
                                                formKey: _registerFormController
                                                    .formKey);
                                        if (isValid) {
                                          setState(() {
                                            _registerFormController
                                                .loadingFinish = true;
                                          });
                                          if (fetchState
                                              is CompleteFetchHomeUnitFetchStates) {
                                            var houseServiceProvider =
                                                _registerFormController
                                                    .generateHouseServiceProviderForm(
                                              fetchState.homeUnitEntity,
                                            );
                                            _registerFormController
                                                .register(houseServiceProvider);
                                            await Future.delayed(
                                                const Duration(seconds: 3));
                                            setState(() {
                                              _registerFormController.finish =
                                                  true;
                                              _registerFormController
                                                  .loadingFinish = false;
                                            });
                                          } else {
                                            if (fetchUserState
                                                is CompleteFetchUserResidentLoginState) {
                                              context.read<FetchUnitBloc>().add(
                                                  FetchHomeUnitFetchEvents(
                                                      fetchUserState.resident
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
