import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MySubscription extends ConsumerWidget {
  const MySubscription({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(child: Text("Je suis abonné !"));
  }
}
