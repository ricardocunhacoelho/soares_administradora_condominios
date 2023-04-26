import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/maintenance/domain/entity/maintenance.entity.dart';
import 'package:soares_administradora_condominios/app.style.dart';
import 'package:soares_administradora_condominios/condominium/bloc/called.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/maintenance.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/maintenance/add.image.maintenance.dialog.dart';
import 'package:soares_administradora_condominios/condominium/components/maintenance/controller/maintenance.controller.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

import '../../../size.config.dart';

class FormRequestMaintenance extends StatefulWidget {
  final String residentID;
  final String unitId;
  const FormRequestMaintenance(
      {super.key, required this.residentID, required this.unitId});

  @override
  State<FormRequestMaintenance> createState() => _FormRequestMaintenanceState();
}

class _FormRequestMaintenanceState extends State<FormRequestMaintenance> {
  register(MaintenanceEntity maintenance) {
    context.read<MaintenanceBloc>().add(RequestMaintenanceEvent(maintenance));
  }
  final _controllerObservation = TextEditingController();
  final _controllerLocal = TextEditingController();

  late MaintenanceController controller = MaintenanceController(() {
    setState(() {});
  }, register);
 
  Widget fielObservation() {
    return TextFormField(
      onSaved: (newValue) => controller.observation = newValue,
      validator: (value) =>
          controller.validateObservation(_controllerObservation.text),
      controller: _controllerObservation,
      minLines: 3,
      maxLines: 5,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
          hintText: 'Entre com uma observação',
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)))),
    );
  }

  Widget fielLocal() {
    return TextFormField(
      onSaved: (newValue) => controller.local = newValue,
      validator: (value) => controller.validateLocal(_controllerLocal.text),
      controller: _controllerLocal,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          hintText: 'ex.: Bloco A 1º andar, Academia, Elevador',
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final calledBloc = context.watch<CalledBloc>();
    final calledState = calledBloc.state;

    return Column(
      children: [
        controller.loadingFinish
            ? const Center(child: CircularProgressIndicator())
            : !controller.finish
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.foul)
                          Column(
                            children: [
                              Text('É necessário que entre com uma imagem',
                                  style: kPoppinsSemiBold.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3.5,
                                      color: Colors.red)),
                              const SizedBox(height: 15),
                            ],
                          ),
                        Text('Adicione uma foto do local: ',
                            style: kPoppinsSemiBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                color: kDarkBlue)),
                        const SizedBox(height: 25),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AddImageMaintenanceDialog(
                                      controller: controller);
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
                                child: controller.image == null
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
                                        controller.image!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              if (controller.image != null)
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
                        Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Informe o local:',
                                  style: kPoppinsSemiBold.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3.5,
                                      color: kDarkBlue)),
                              fielLocal(),
                              const SizedBox(height: 12),
                              Text('Observação:',
                                  style: kPoppinsSemiBold.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3.5,
                                      color: kDarkBlue)),
                              const SizedBox(height: 12),
                              fielObservation(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: SizedBox(
                            width: 200,
                            child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kBlue),
                                ),
                                onPressed: () async {
                                  if (controller.image != null) {
                                    final isValid = controller.validate(
                                        formKey: controller.formKey);
                                    if (isValid) {
                                      setState(() {
                                        controller.loadingFinish = true;
                                      });
                                      controller.finalizeUpload(
                                          controller.observation!,
                                          widget.residentID,
                                          widget.unitId);
                                      await Future.delayed(
                                          const Duration(seconds: 5));
                                      setState(() {
                                        controller.finish = true;
                                        controller.loadingFinish = false;
                                      });
                                    } else {
                                      print('formValido nao valido');
                                    }
                                  } else {
                                    setState(() {
                                      controller.foul = true;
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    'Enviar',
                                    style: kPoppinsSemiBold.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 4.5,
                                      color: kLightWhite,
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(bottom: 30, right: 20, left: 20),
                    child: Column(children: [
                      Text(
                        'Agradecemos pela solicitação, a administração estará tomando as providências necessárias!',
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
                              'Local: ${controller.local}',
                              style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                color: kDarkBlue,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Observação: ${controller.observation}',
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
                              child: Image.file(
                                controller.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
      ],
    );
  }
}
