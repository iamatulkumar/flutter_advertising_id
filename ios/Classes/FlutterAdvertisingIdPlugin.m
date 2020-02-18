#import "FlutterAdvertisingIdPlugin.h"
#import <flutter_advertising_id/flutter_advertising_id-Swift.h>

@implementation FlutterAdvertisingIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAdvertisingIdPlugin registerWithRegistrar:registrar];
}
@end
