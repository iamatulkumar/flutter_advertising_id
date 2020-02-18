import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAdvertisingId {
  static const MethodChannel _channel = const MethodChannel('flutter_advertising_id');

  static Future<String> get advertisingId async {
    final String id = await _channel.invokeMethod('getAdvertisingId');
    return id;
  }
}
