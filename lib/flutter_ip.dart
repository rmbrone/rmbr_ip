import 'dart:async';

import 'package:flutter/services.dart';

class FlutterIp {
  static const MethodChannel _channel = const MethodChannel('flutter_ip');

  static Future<String?> get networkType async {
    try {
      final String? type = await _channel.invokeMethod('getNetworkType');
      return type;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<String?> get internalIP async {
    try {
      final String? ip = await _channel.invokeMethod('getInternalIP');
      return ip;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<String?> get externalIP async {
    try {
      final String? ip = await _channel.invokeMethod('getExternalIP');
      return ip;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
