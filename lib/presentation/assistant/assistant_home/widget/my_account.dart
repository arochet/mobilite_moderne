import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';

class MyAccount extends ConsumerWidget {
  const MyAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        printDev();
        context.router.push(AccountRoute());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.account_circle, size: 35),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppAsync(
                      ref.watch(currentUserData),
                      builder: (UserData? p0) => Text(p0?.userName.getOrCrash() ?? 'no user',
                          style: Theme.of(context).textTheme.titleMedium),
                      loading: Text('...'),
                    ),
                    AppAsync(
                      ref.watch(currentUserData),
                      builder: (UserData? p0) => Text(p0?.email?.getOrCrash() ?? 'no user',
                          style: Theme.of(context).textTheme.bodyMedium),
                      loading: Text('...'),
                    ),
                  ],
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
