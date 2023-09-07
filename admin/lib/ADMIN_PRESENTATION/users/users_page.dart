import 'package:admin/ADMIN_PRESENTATION/core/_components/app_async.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_components/display_db_table.dart';
import 'package:admin/providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class UsersPage extends ConsumerWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamListUser = ref.watch(listUsersFormNotifierProvider); //Liste des utilisateurs

    return ShowComponentFile(
        title: './lib/PRESENTATION/users/users_page.dart',
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: AppAsync(streamListUser, builder: (Option<List<UserData>>? optionListUserData) {
              return optionListUserData!.fold(() => Container(), (List<UserData> listUser) {
                //Tableau des utilisateurs (Table Users)
                return DisplayDBTable(
                    nameTable: 'Users',
                    titles: const [
                      CellHeader('Nom', width: 120),
                      CellHeader('Email', width: 80),
                      CellHeader('Mdp Crypté'),
                      CellHeader('Type de compte', width: 120)
                    ],
                    rowLength: listUser.length,
                    cell: ((column, row) {
                      switch (column) {
                        case 0:
                          return listUser[row].userName.getOrCrash();
                        case 1:
                          return listUser[row].email?.getOrCrash() ?? ' - ';
                        case 2:
                          return listUser[row].passwordCrypted;
                        case 3:
                          return listUser[row].typeAccount.getOrCrash().toDisplayString();
                        default:
                          return 'error';
                      }
                    }));
              });
            })));
  }
}
