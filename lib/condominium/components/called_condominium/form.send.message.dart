import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/domain/entity/called.entity.dart';
import 'package:soares_administradora_condominios/app.style.dart';
import 'package:soares_administradora_condominios/condominium/bloc/called.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/called_condominium/controller/called.controller.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

import '../../../size.config.dart';

class FormSendMessage extends StatefulWidget {
  final String residentID;
  final String unitId;
  const FormSendMessage({super.key, required this.residentID, required this.unitId});

  @override
  State<FormSendMessage> createState() => _FormSendMessageState();
}

class _FormSendMessageState extends State<FormSendMessage> {
  final _controllerMessage = TextEditingController();

  late CalledController controller = CalledController(() {
    setState(() {});
  });
  @override
  void initState() {
    context.read<CalledBloc>().add(InitCalledEvent());
  }

  @override
  Widget build(BuildContext context) {
    final calledBloc = context.watch<CalledBloc>();
    final calledState = calledBloc.state;

    return Column(
      children: [
        if (calledState is InitialCalledState)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (controller.foul)
                  Column(
                    children: [
                      Text('É necessário que sejam preenchidos todos os campos',
                          style: kPoppinsSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                              color: kDarkBlue)),
                      const SizedBox(height: 15),
                    ],
                  ),
                Text('Marque a que setor sua mensagem se destina:',
                    style: kPoppinsSemiBold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        color: kDarkBlue)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text('Síndico/Administração:',
                        style: kPoppinsSemiBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: kDarkBlue)),
                    Radio<ESectorDestiny>(
                      value: ESectorDestiny.sindico,
                      groupValue: controller.eSectorDestiny,
                      onChanged: (ESectorDestiny? value) {
                        setState(() {
                          controller.eSectorDestiny = value;
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    Text('Portaria:',
                        style: kPoppinsSemiBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: kDarkBlue)),
                    Radio<ESectorDestiny>(
                      value: ESectorDestiny.porteiro,
                      groupValue: controller.eSectorDestiny,
                      onChanged: (ESectorDestiny? value) {
                        setState(() {
                          controller.eSectorDestiny = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ValueListenableBuilder(
                    valueListenable: controller.dropValue,
                    builder: (BuildContext context, String value, _) {
                      return SizedBox(
                        width: 250,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              label: Text('Assunto',
                                  style: kPoppinsSemiBold.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 4,
                                      color: kDarkBlue)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(kBorderRadius),
                              )),
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down_circle),
                          hint: const Text('Selecione um assunto'),
                          value: (value.isEmpty) ? null : value,
                          onChanged: (escolha) =>
                              controller.dropValue.value = escolha.toString(),
                          items: controller.dropAboutOptions
                              .map((op) => DropdownMenuItem(
                                    child: Text(op),
                                    value: op,
                                  ))
                              .toList(),
                        ),
                      );
                    }),
                const SizedBox(height: 25),
                Text('Digite sua mensagem:',
                    style: kPoppinsSemiBold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        color: kDarkBlue)),
                const SizedBox(height: 12),
                Form(
                  key: controller.formKey,
                  child: TextFormField(
                    onSaved: (newValue) => controller.message = newValue,
                    validator: (value) =>
                        controller.validateMessage(_controllerMessage.text),
                    controller: _controllerMessage,
                    minLines: 3,
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        hintText: 'Entre com a mensagem',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(kBorderRadius)))),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(kBlue),
                        ),
                        onPressed: () async {
                          if (controller.eSectorDestiny != null &&
                              controller.dropValue.value != '') {
                            final isValid = controller.validate(
                                formKey: controller.formKey);
                            if (isValid) {
                              final called = controller.generateCalled(
                                  controller.message!,
                                  controller.dropValue.value,
                                  controller.eSectorDestiny!,
                                  widget.residentID,
                                  widget.unitId
                                  );
                              context
                                  .read<CalledBloc>()
                                  .add(SendCalledEvent(called));
                            }
                          } else {
                            setState(() {
                              controller.foul = true;
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Enviar',
                            style: kPoppinsSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                              color: kLightWhite,
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        if (calledState is LoadingSendCalledState)
          const Center(child: CircularProgressIndicator()),
        if (calledState is CompleteSendCalledState)
          Text('enviado mensagem: ${controller.message}')
      ],
    );
  }
}
