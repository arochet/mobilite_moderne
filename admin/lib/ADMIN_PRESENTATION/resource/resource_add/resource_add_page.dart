import 'package:admin/ADMIN_PRESENTATION/core/_components/main_scaffold.dart';

import 'widget/resource_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ResourceAddPage extends StatelessWidget {
  const ResourceAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      title: 'ResourceAdd',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ResourceFormProvider(),
        ),
      ),
    );
  }
}
