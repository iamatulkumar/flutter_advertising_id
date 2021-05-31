# flutter_advertising_id
 
Flutter plugin to get GAID android and IDFA ios.

Demonstrates how to use the flutter_advertising_id plugin.

## Usage
To use this plugin, add `flutter_advertising_id` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Getting Started

Check out the `example` directory for a sample app using flutter advertising id.

In your flutter project add the dependency:

```yml
dependencies:
  ...
  flutter_advertising_id: ^1.0.3
```
For help getting started with Flutter, view the online
[documentation](https://flutter.io/).

## Usage example

import `package:flutter_advertising_id/flutter_advertising_id.dart;`

```dart
import 'package:flutter_advertising_id/flutter_advertising_id.dart';
```

```$xslt
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _advertisingId = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // AdvertisingId are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String advertisingId;
    // Advertising id may fail, so we use a try/catch PlatformException.
    try {
      advertisingId = await FlutterAdvertisingId.advertisingId;
    } on PlatformException {
      advertisingId = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _advertisingId = advertisingId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_advertisingId\n'),
        ),
      ),
    );
  }
}

```
