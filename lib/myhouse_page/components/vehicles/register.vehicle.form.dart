import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/residents/resident.form.add.picture.dialog.dart';
import 'package:soares_administradora_condominios/myhouse_page/controler/register.form.controller.dart';
import 'package:soares_administradora_condominios/myhouse_page/events/myhouse.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';
import '../../bloc/myhouse.bloc.dart';

class RegisterVehicleForm extends StatefulWidget {
  const RegisterVehicleForm({super.key});

  @override
  State<RegisterVehicleForm> createState() => _RegisterVehicleFormState();
}

class _RegisterVehicleFormState extends State<RegisterVehicleForm> {
  register(ResidentEntity resident) {
    context.read<MyHouseBloc>().add(RegisterResidentMyHouseEvent(resident));
  }

  final _controllerModel = TextEditingController();
  final _controllerColor = TextEditingController();
  final _controllerPlate = TextEditingController();
  final _controllerYear = TextEditingController();

  late final RegisterVehicleFormController _registerFormController =
      RegisterVehicleFormController(() {
    setState(() {});
  }, register);

  Widget fieldModel() {
    return TextFormField(
      onSaved: (newValue) => _registerFormController.name = newValue,
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
      onSaved: (newValue) => _registerFormController.Color = newValue,
      validator: (value) =>
          _registerFormController.validateColor(_controllerColor.text),
      controller: _controllerColor,
      decoration: const InputDecoration(
          label: Text('Color'), hintText: 'exemplo@gmail.com'),
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
                      const SizedBox(height: 25),
                      Text(
                        'Aguarde até que alguém da diretoria do condomínio aprove o acesso. A senha inicial será o CPF do morador(a) e o login o e-mail cadastrado.',
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
                              'E-mail: ${_registerFormController.email}',
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
                                  return AddPictureDialog(
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
                              'É obrigatório entrar com uma foto do morador(a) para o reconhecimento na portaria.',
                              style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                color: color,
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
                                SizedBox(height: 30),

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
                                        } else {
                                          setState(() {
                                            color = Colors.redAccent;
                                          });
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
