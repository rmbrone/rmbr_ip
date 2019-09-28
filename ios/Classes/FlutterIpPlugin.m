#import "FlutterIpPlugin.h"
#import <flutter_ip/flutter_ip-Swift.h>
#include <ifaddrs.h>


@implementation FlutterIpPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterIpPlugin registerWithRegistrar:registrar];
}
@end
