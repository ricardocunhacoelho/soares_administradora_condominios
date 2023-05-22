import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/reserve.entity.dart';
import 'package:soares_administradora_condominios/app.style.dart';
import 'package:soares_administradora_condominios/condominium/bloc/fetch.area.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/controller/area.condominium.controller.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/payment.reserve.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';
import 'package:soares_administradora_condominios/login/bloc/fetch.user.login.bloc.dart';
import 'package:soares_administradora_condominios/login/states/login.states.dart';

import '../../../size.config.dart';

class FormReservation extends StatefulWidget {
  const FormReservation({super.key});

  @override
  State<FormReservation> createState() => _FormReservationState();
}

class _FormReservationState extends State<FormReservation> {
  late AreaCondominiumController controller = AreaCondominiumController(() {
    setState(() {});
  });

  final _controllerReserveDate = TextEditingController();
  final _controllerReservationMotivation = TextEditingController();
  final _controllerNumberGuests = TextEditingController();
  final _controllerGuests = TextEditingController();

  Widget fieldReserveDateDate(Set<String> unselectableDates) {
    DateTime day = DateTime.now();

    return TextFormField(
      controller: _controllerReserveDate,
      keyboardType: TextInputType.none,
      validator: (value) =>
          controller.validateReserveDate(_controllerReserveDate.text),
      decoration: const InputDecoration(
          icon: Icon(Icons.calendar_month), labelText: "Data para reserva"),
      onTap: () async {
        DateTime? pickeddate = await showDatePicker(
            context: context,
            initialDate: unselectableDates.isEmpty ? DateTime.now() :
                controller.checkPredicate(unselectableDates),
            firstDate: DateTime.now(),
            lastDate: DateTime(2101),
            selectableDayPredicate: (DateTime val) {
              String sanitized = controller.sanitizeDateTime(val);
              return !unselectableDates.contains(sanitized);
            });
        if (pickeddate != null) {
          setState(() {
            _controllerReserveDate.text =
                DateFormat('dd-MM-yyyy').format(pickeddate);
            controller.reserveDate = pickeddate;
          });
        }
      },
    );
  }

  Widget fieldReservationMotivation() {
    return TextFormField(
      onSaved: (newValue) => controller.motivation = newValue,
      validator: (value) =>
          controller.validateMotivation(_controllerReservationMotivation.text),
      controller: _controllerReservationMotivation,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          hintText: 'Entre com o motivo',
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)))),
    );
  }

  Widget fieldNumberGuests() {
    return TextFormField(
      onChanged: (newValue) => controller.numberGuests = int.parse(newValue),
      onSaved: (newValue) => controller.numberGuests = int.parse(newValue!),
      validator: (value) =>
          controller.validateNumberGuests(_controllerNumberGuests.text),
      controller: _controllerNumberGuests,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          hintText: 'ex.: 30',
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)))),
    );
  }

  Widget fieldGuests() {
    return TextFormField(
      onSaved: (newValue) => controller.guests = newValue,
      validator: (value) => controller.validateGuests(_controllerGuests.text),
      controller: _controllerGuests,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          hintText: 'ex.: Ricardo, Jorge',
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fetchAreaBloc = context.watch<FetchAreaBloc>();
    final fetchAreaState = fetchAreaBloc.state;

    final fetchUserBloc = context.watch<FetchUserBloc>();
    final fetchUserState = fetchUserBloc.state;

    return Scaffold(
      backgroundColor: kLightWhite,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.navigate_before,
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.help_center,
              color: kDarkGrey,
              size: SizeConfig.blockSizeHorizontal! * 7.5,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (fetchAreaState is CompleteFetchAreaCondominiumState &&
                  fetchUserState is CompleteFetchUserResidentLoginState)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.foul)
                        Column(
                          children: [
                            Text(
                                'É necessário que sejam preenchidos todos os campos',
                                style: kPoppinsSemiBold.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                    color: kDarkBlue)),
                            const SizedBox(height: 15),
                          ],
                        ),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Informe a data para reserva',
                                style: kPoppinsSemiBold.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                    color: kDarkBlue)),
                            const SizedBox(height: 12),
                            BlocBuilder<FetchAreaBloc,
                                FetchAreaCondominiumStates>(
                              builder: (context, state) {
                                if (state
                                    is CompleteFetchAreaCondominiumState) {
                                  final listDateTime = state
                                      .area.reserveDateList as List<DateTime>;
                                  final listDateSet =
                                      controller.getDateSet(listDateTime);
                                  return fieldReserveDateDate(listDateSet);
                                } else if (state
                                    is LoadingFetchAreaCondominiumState) {
                                  return CircularProgressIndicator();
                                } else {
                                  return Container();
                                }
                              },
                            ),
                            const SizedBox(height: 12),
                            Text('Diga-nos para o que será utilizado o espaço:',
                                style: kPoppinsSemiBold.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                    color: kDarkBlue)),
                            const SizedBox(height: 12),
                            fieldReservationMotivation(),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Text('Número de convidados:',
                                    style: kPoppinsSemiBold.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.5,
                                        color: kDarkBlue)),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 100,
                                  child: fieldNumberGuests(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text('Capacidade máxima de 30 pessoas',
                                style: kPoppinsBold.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                    color: kDarkBlue)),
                            const SizedBox(height: 35),
                            Text('Nome dos convidados:',
                                style: kPoppinsSemiBold.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                    color: kDarkBlue)),
                            const SizedBox(height: 12),
                            fieldGuests(),
                            const SizedBox(height: 12),
                            Text(
                                '* Os nomes devem ser separados por virgula ex.: Ricardo, Jorge,  José Carlos',
                                style: kPoppinsBold.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                    color: kDarkBlue)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          width: 250,
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kBlue),
                              ),
                              onPressed: () async {
                                final isValid = controller.validate(
                                    formKey: controller.formKey);

                                if (isValid) {
                                  setState(() {
                                    controller.loadingFinish = true;
                                  });
                                  final ReserveEntity reserve =
                                      controller.generateReserve(
                                          fetchAreaState.area,
                                          fetchUserState.resident);
                                  Navigator.pushNamed(
                                      context, '/paymentReservationPage',
                                      arguments: PaymentReservationArgs(
                                          reserve, fetchUserState.resident));
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Center(
                                  child: Text(
                                    'Pagamento',
                                    style: kPoppinsSemiBold.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 4.5,
                                      color: kLightWhite,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              if (fetchAreaState is LoadingFetchAreaCondominiumState ||
                  fetchUserState is LoadingFetchUserLoginState)
                const Center(child: CircularProgressIndicator()),
              if (fetchAreaState is ErrorFetchAreaCondominiumState ||
                  fetchUserState is ErrorFetchUserLoginState)
                Text('Error')
            ],
          ),
        ),
      ),
    );
  }
}
