import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_failure.freezed.dart';

///Type de failure lié au serveur
@freezed
abstract class SubscriptionFailure with _$SubscriptionFailure {
  const factory SubscriptionFailure.serverError() = ServerError;
  const factory SubscriptionFailure.noInternet() = NoInternet;
  const factory SubscriptionFailure.customerUnfound() = CustomerUnfound;
  const factory SubscriptionFailure.paymentFail() = PaymentFail;
}
