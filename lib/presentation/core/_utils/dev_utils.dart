import 'package:mobilite_moderne/injection.dart';

//Cette fonction affiche le nom de la fonction appelante des repositories
printDev() {
  bool can = getIt<AppLog>().can;
  if (can) print('[DEV] ${getCallingFunctionName()}');
}

String? getCallingFunctionName() {
  StackTrace stackTrace = StackTrace.current;
  List<String> traceLines = stackTrace.toString().trim().split('\n');
  String callerLine = traceLines[2].trim();
  RegExp regExp = RegExp(r'#\d+\s+(.+)');
  Match match = regExp.firstMatch(callerLine) as Match;
  String? functionName = match.group(1);
  return functionName;
}

class AppLog {
  bool can = false;
  AppLog();
}
