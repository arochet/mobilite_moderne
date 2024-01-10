import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/subscription_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/subscriptions.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/providers.dart';

import 'app_async.dart';

class IsSuscribed extends ConsumerStatefulWidget {
  final Widget child;
  const IsSuscribed({Key? key, required this.child}) : super(key: key);

  @override
  _IsSuscribedState createState() => _IsSuscribedState();
}

class _IsSuscribedState extends ConsumerState<IsSuscribed> {
  @override
  Widget build(BuildContext context) {
    final isSuscribed = ref.watch(userIsSubscribed);

    return AppAsync(
      isSuscribed,
      builder: (Either<SubscriptionFailure, Subscriptions?> subscriptionEither) {
        return subscriptionEither.fold((error) {
          return Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppError(message: "${error.message}"),
              ),
            ),
          );
        }, (subscription) {
          if (subscription != null) {
            return widget.child;
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text("Vous n'avez pas d'abonnement"),
                  )),
                  ElevatedButton(
                    onPressed: () {
                      context.router.push(Subscription_stripeRoute());
                    },
                    child: Text("Souscrire"),
                  )
                ],
              ),
            );
          }
        });
      },
    );
  }
}
