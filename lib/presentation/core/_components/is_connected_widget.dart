import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

/// Affiche un bandeau en haut de l'écran si pas de connexion internet
class IsConnected extends StatefulWidget {
  final Widget child;
  final Color colorMsg;
  const IsConnected({Key? key, required this.child, this.colorMsg = Colors.black}) : super(key: key);

  @override
  State<IsConnected> createState() => _IsConnectedState();
}

class _IsConnectedState extends State<IsConnected> {
  ConnectivityResult _connectionStatus = ConnectivityResult.mobile;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_connectionStatus == ConnectivityResult.none)
          Container(
            height: 40,
            child: Center(
              child: Text("Pas de connexion internet",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: widget.colorMsg)),
            ),
          ),
        Expanded(child: widget.child),
      ],
    );
  }
}
