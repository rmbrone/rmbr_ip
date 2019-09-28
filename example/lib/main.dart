import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_ip/flutter_ip.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _internalIP = 'Unknown';
  String _externalIP = 'Unknown';
  String _networkType = "Unknown";

  @override
  void initState() {
    super.initState();
    _updateNetworkInformation();
  }

  Future<void> _updateInternalIP() async {
    String ip;
    try {
      ip = await FlutterIp.internalIP;
    } on PlatformException {
      ip = 'Failed to get ip.';
    }
    if (!mounted) return;

    setState(() {
      _internalIP = ip;
    });
  }

  Future<void> _updateExternalIP() async {
    String ip;
    try {
      ip = await FlutterIp.externalIP;
    } on PlatformException {
      ip = 'Failed to get ip.';
    }
    if (!mounted) return;

    setState(() {
      _externalIP = ip;
    });
  }

  Future<void> _updateNetworkType() async {
    String networkType;
    try {
      networkType = await FlutterIp.networkType;
    } on PlatformException {
      networkType = 'Failed to get network type.';
    }
    if (!mounted) return;

    setState(() {
      _networkType = networkType;
    });
  }

  _updateNetworkInformation() {
    _updateInternalIP();
    _updateExternalIP();
    _updateNetworkType();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.7),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Flutter Plugin',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.0)),
              SizedBox(
                width: 5,
              ),
              Text('flutter_ip v1',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 2.0)),
            ],
          ),
        ),
        body: Center(
            child: InkWell(
          onTap: _updateNetworkInformation,
          child: Container(
            padding: const EdgeInsets.all(40.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Internal IP Address',
                  style: titleStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 5),
                  child: Text(
                    '$_internalIP\n',
                    style: resultStyle,
                  ),
                ),
                Text(
                  'External IP Address',
                  style: titleStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 5),
                  child: Text(
                    '$_externalIP\n',
                    style: resultStyle,
                  ),
                ),
                Text(
                  'Network',
                  style: titleStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 5),
                  child: Text(
                    '$_networkType\n',
                    style: resultStyle,
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

TextStyle titleStyle = TextStyle(
  color: Colors.black.withOpacity(0.6),
  fontSize: 18,
  fontWeight: FontWeight.w200,
  letterSpacing: 0.5,
);
TextStyle resultStyle = TextStyle(
  color: Colors.black,
  fontSize: 30,
);
