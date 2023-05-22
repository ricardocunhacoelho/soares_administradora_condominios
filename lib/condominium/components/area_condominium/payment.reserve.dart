import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/reserve.entity.dart';
import 'package:soares_administradora_condominios/condominium/bloc/area.condominium.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/payment/payment_bloc.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class PaymentReservationArgs {
  final ReserveEntity reserve;
  final ResidentEntity resident;

  PaymentReservationArgs(this.reserve, this.resident);
}

class PaymentReservation extends StatefulWidget {
  static const routeName = '/paymentReservationPage';

  const PaymentReservation({super.key});

  @override
  State<PaymentReservation> createState() => _PaymentReservationState();
}

class _PaymentReservationState extends State<PaymentReservation> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as PaymentReservationArgs;

    final paymentBloc = context.watch<PaymentBloc>();
    final paymentState = paymentBloc.state;
    final areaCondominiumBloc = context.watch<AreaCondominiumBloc>();
    final areaCondominiumState = areaCondominiumBloc.state;
    CardFormEditController controller = CardFormEditController(
        initialDetails: paymentState.cardFieldInputDetails);

    return Scaffold(
      appBar: paymentState.status == PaymentStatus.initial
          ? AppBar(
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
              backgroundColor: kWhite,
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
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                if (paymentState.status == PaymentStatus.initial)
                  Column(
                    children: [
                      Text(
                        'Card Form',
                        style: kPoppinsBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 5,
                            color: kDarkBlue),
                      ),
                      const SizedBox(height: 20),
                      CardFormField(
                        controller: controller,
                        enablePostalCode: false,
                      ),
                      const SizedBox(height: 12),
                      Text('Pagamento no valor de ${args.reserve.price}',
                          style: kPoppinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 5,
                              color: kDarkBlue)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            (controller.details.complete)
                                ? context.read<PaymentBloc>().add(
                                    PaymentCreateIntent(
                                        billingDetails: BillingDetails(
                                            email: args.resident.email),
                                        item: args.reserve.price,
                                        reserve: args.reserve,
                                        uid: args.resident.id))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Formulario nao completo')));
                          },
                          child: Text('Pagar'))
                    ],
                  ),
                if (paymentState.status == PaymentStatus.loading)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                if (paymentState.status == PaymentStatus.success)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.greenAccent,
                              size: SizeConfig.blockSizeHorizontal! * 10,
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                'Pagamento efetuado com sucesso',
                                style: kPoppinsBold.copyWith(
                                    fontSize: SizeConfig.blockSizeHorizontal! * 5,
                                    color: Colors.greenAccent),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.popUntil(context,
                                  ModalRoute.withName("/areaCondominiumPage"));
                              context.read<PaymentBloc>().add(PaymentStart());
                            },
                            child: Text('Voltar'))
                      ],
                    ),
                  ),
                if (paymentState.status == PaymentStatus.failure ||
                    areaCondominiumState
                        is ErrorMakeReserveAreaCondominiumState)
                  Column(
                    children: [
                      Text('Pagamento falhou'),
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {
                            context.read<PaymentBloc>().add(PaymentStart());
                          },
                          child: Text('Voltar'))
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
