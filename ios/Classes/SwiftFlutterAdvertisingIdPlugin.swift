// Copyright 2020 The Author. All rights reserved.
// Use of this source code is governed by a license that can be
// found in the LICENSE file.
import Flutter
import UIKit
import AdSupport

/*SwiftFlutterAdvertisingIdPlugin*/
public class SwiftFlutterAdvertisingIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_advertising_id", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterAdvertisingIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  // Method Channel
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
        case "getAdvertisingId":
            var idfaString: String!
            let manager = ASIdentifierManager.shared()
            if manager.isAdvertisingTrackingEnabled {
                idfaString = manager.advertisingIdentifier.uuidString
            } else {
                idfaString = ""
            }
            result(idfaString)
        default:
            result(nil)
        }
  }
}
