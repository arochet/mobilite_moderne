//import 'dart:html';

import 'package:mobilite_moderne/main_common.dart';
import 'package:injectable/injectable.dart';
//import 'dart:ui' as ui;

Future<void> main() async {
  /* ui.platformViewRegistry.registerViewFactory(
      'hello-world-html',
      (int viewId) => IFrameElement()
        ..width = '640'
        ..height = '360'
        ..src = 'https://www.decathlon.fr/'
        ..style.border = 'none'); */
  await mainCommon(Environment(Environment.dev));
}
