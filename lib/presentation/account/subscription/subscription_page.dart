import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/form_subscription.dart';
import 'widget/my_subscribed.dart';

@RoutePage()
class Subscription_stripePage extends StatelessWidget {
  const Subscription_stripePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Abonnement Dist\'Atelier',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: _IsSubscribe(),
        ),
      ),
    );
  }
}

class _IsSubscribe extends ConsumerWidget {
  const _IsSubscribe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userIsSubscribed);

    return user.when(
      data: (bool isSubscribed) {
        if (isSubscribed) {
          return MySubscription();
        } else {
          return FormSubscription();
        }
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text(err.toString()),
    );
  }
}
