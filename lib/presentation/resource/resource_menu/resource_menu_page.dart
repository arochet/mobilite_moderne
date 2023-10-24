import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/assets_image.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/search_algolia/search_algolia.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/panel_category_list.dart';

@RoutePage()
class Resource_menuPage extends StatelessWidget {
  const Resource_menuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: 'Resource_menuPage',
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssetsImage.fondMenuWeb),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 10, left: 10),
          child: _Body(),
        ),
      ),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends ConsumerState<_Body> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: ResourceMainCategory.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpaceH10(),
        Text("RESSOURCES",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 26, color: Colors.white)),
        const SpaceH20(),
        Expanded(
          child: Container(
            constraints: BoxConstraints(maxWidth: 700),
            child: SearchAlgolia(controller: controller, child: PanelCategoryList(ref.watch(currentOnglet))),
          ),
        ),
      ],
    );
  }
}
