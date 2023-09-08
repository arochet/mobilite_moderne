import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionNumber extends StatefulWidget {
  const VersionNumber({
    Key? key,
  }) : super(key: key);

  @override
  _VersionNumberState createState() => _VersionNumberState();
}

class _VersionNumberState extends State<VersionNumber> {
  String version = "";
  @override
  void initState() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        version = "${packageInfo.version}-${packageInfo.buildNumber}";
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("v$version",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Color(0xff1b2d45))),
      ),
    );
  }
}
