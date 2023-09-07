import 'package:mobilite_moderne/main_common.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  await mainCommon(Environment(Environment.prod));
}
