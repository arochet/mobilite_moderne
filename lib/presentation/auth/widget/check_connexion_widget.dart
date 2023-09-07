import 'package:mobilite_moderne/APPLICATION/auth/auth_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

//Classe chelou qui fait que l'on peut pas se déconnecter si on l'enlève de HomePage
class CheckUserConnected extends ConsumerStatefulWidget {
  final Widget child;
  const CheckUserConnected({Key? key, required this.child}) : super(key: key);

  @override
  _CheckUserConnectedState createState() => _CheckUserConnectedState();
}

class _CheckUserConnectedState extends ConsumerState<CheckUserConnected> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => getOut(ref.read(authNotifierProvider)));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authNotifierProvider, (prev, myAuthState) {
      getOut(myAuthState);
    });

    return widget.child;
  }

  getOut(state) {
    if (!(state is AuthAuthenticated)) {
      Future.delayed(Duration.zero, () {
        context.router.replaceAll([AuthInitRoute()]);
      });
    }
  }
}
