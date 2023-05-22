part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PaymentStart extends PaymentEvent {}

class PaymentCreateIntent extends PaymentEvent {
  final BillingDetails billingDetails;
  final double item;
  final ReserveEntity reserve;
  final String uid;

  const PaymentCreateIntent({
    required this.billingDetails,
    required this.item,
    required this.reserve,
    required this.uid,
  });

  @override
  List<Object> get props => [billingDetails, item, reserve, uid];
}

class PaymentConfirmIntent extends PaymentEvent {
  final String clientSecret;

  const PaymentConfirmIntent({required this.clientSecret});
  @override
  List<Object> get props => [clientSecret];
}
