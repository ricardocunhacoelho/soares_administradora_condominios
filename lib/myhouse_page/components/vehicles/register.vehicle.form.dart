import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/controler/register.form.controller.vehicle.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';
import '../../bloc/myhouse.bloc.dart';

class RegisterVehicleForm extends StatefulWidget {
  const RegisterVehicleForm({super.key});

  @override
  State<RegisterVehicleForm> createState() => _RegisterVehicleFormState();
}

class _RegisterVehicleFormState extends State<RegisterVehicleForm> {
  register(VehicleEntity vehicle, String idUnit) {
    context
        .read<MyHouseBloc>()
        .add(RegisterVehicleMyHouseEvent(vehicle, idUnit));
  }

  final _controllerModel = TextEditingController();
  final _controllerColor = TextEditingController();
  final _controllerPlate = TextEditingController();
  final _controllerYear = TextEditingController();

  late final RegisterVehicleFormController _registerFormController =
      RegisterVehicleFormController(() {
    setState(() {});
  });

  Widget fieldModel() {
    return TextFormField(
      onSaved: (newValue) => _registerFormController.model = newValue,
      validator: (value) =>
          _registerFormController.validateModel(_controllerModel.text),
      controller: _controllerModel,
      decoration: const InputDecoration(
        label: Text('Modelo'),
      ),
    );
  }

  Widget fieldColor() {
    return TextFormField(
      onSaved: (newValue) => _registerFormController.color = newValue,
      validator: (value) =>
          _registerFormController.validateColor(_controllerColor.text),
      controller: _controllerColor,
      decoration: const InputDecoration(label: Text('Cor'), hintText: 'Preto'),
    );
  }

  Widget fieldPlate() {
    MaskTextInputFormatter maskFormatterPlate = MaskTextInputFormatter(
        mask: '#######',
        filter: {"#": RegExp(r'[0-9,A-Z, a-z]')},
        type: MaskAutoCompletionType.lazy);
    return TextFormField(
      onSaved: (newValue) => _registerFormController.plate = newValue,
      validator: (value) =>
          _registerFormController.validatePlate(_controllerPlate.text),
      controller: _controllerPlate,
      inputFormatters: [maskFormatterPlate],
      decoration:
          const InputDecoration(label: Text('Placa'), hintText: 'BRA2E19'),
    );
  }

  Widget fieldYear() {
    MaskTextInputFormatter maskFormatterYear = MaskTextInputFormatter(
        mask: '####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return TextFormField(
      onSaved: (newValue) =>
          _registerFormController.year = int.tryParse(newValue!),
      validator: (value) => _registerFormController
          .validateYear(int.tryParse(_controllerYear.text)),
      controller: _controllerYear,
      inputFormatters: [maskFormatterYear],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text('Ano'),
        hintText: '2020',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fetchBloc = context.watch<FetchUnitBloc>();
    final fetchState = fetchBloc.state;

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
                        'Agradecemos o seu cadastro!',
                        style: kPoppinsSemiBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          color: Colors.orangeAccent,
                        ),
                        textAlign: TextAlign.center,
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
                              _registerFormController.eVehicleType == EVehicleType.car ? 'Carro' : 'Moto',
                              style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                color: kDarkBlue,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Placa: ${_registerFormController.plate}',
                              style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                color: kDarkBlue,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Modelo: ${_registerFormController.model}',
                              style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                color: kDarkBlue,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Ano: ${_registerFormController.year}',
                              style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                color: kDarkBlue,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Cor: ${_registerFormController.color}',
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
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'Veículo: ',
                                        style: kPoppinsMedium.copyWith(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  4,
                                          color: kDarkBlue,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    Text(
                                      'Carro: ',
                                      style: kPoppinsMedium.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 4,
                                        color: kDarkBlue,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Radio<EVehicleType>(
                                      value: EVehicleType.car,
                                      groupValue:
                                          _registerFormController.eVehicleType,
                                      onChanged: (EVehicleType? value) {
                                        setState(() {
                                          _registerFormController.eVehicleType =
                                              value;
                                        });
                                      },
                                    ),
                                    Text(
                                  'Moto: ',
                                  style: kPoppinsMedium.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 4,
                                      color: kDarkBlue,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                    Radio<EVehicleType>(
                                      value: EVehicleType.motorbike,
                                      groupValue:
                                          _registerFormController.eVehicleType,
                                      onChanged: (EVehicleType? value) {
                                        setState(() {
                                          _registerFormController.eVehicleType =
                                              value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                //PLATE
                                fieldPlate(),
                                //space
                                const SizedBox(height: 15),
                                //MODEL
                                fieldModel(),
                                //space
                                const SizedBox(height: 15),
                                //YEAR
                                fieldYear(),
                                //space
                                const SizedBox(height: 15),
                                //COLOR
                                fieldColor(),
                                const SizedBox(height: 30),

                                Text(
                                  'Apenas a administração terá acesso a estas informações para fins de reconhecimento.',
                                  style: kPoppinsMedium.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 4,
                                    color: kDarkBlue,
                                  ),
                                  textAlign: TextAlign.justify,
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
                                            var vehicle =
                                                _registerFormController
                                                    .generateVehicleForm();
                                            await register(vehicle,
                                                fetchState.homeUnitEntity.id);
                                          }

                                          await Future.delayed(
                                              const Duration(seconds: 5));
                                          setState(() {
                                            _registerFormController.finish =
                                                true;
                                            _registerFormController
                                                .loadingFinish = false;
                                          });
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
