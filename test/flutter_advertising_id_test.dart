import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_advertising_id/flutter_advertising_id.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_advertising_id');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42cv-cdsd-dcscd-cdscd';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getAdvertisingId', () async {
    expect(await FlutterAdvertisingId.advertisingId, '42cv-cdsd-dcscd-cdscd');
  });
}
