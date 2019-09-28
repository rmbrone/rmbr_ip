import Flutter
import UIKit
import Ipify

public class SwiftFlutterIpPlugin: NSObject, FlutterPlugin {
  let dispatchQueue = DispatchQueue(label: "Ipify")
  let dispatchGroup  = DispatchGroup()
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_ip", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterIpPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getExternalIP":
        getExternalIP(result: result)
    case "getInternalIP":
        getInternalIP(result: result)
    case "getNetworkType":
        result(getNetworkType())
    default:
        result(FlutterMethodNotImplemented)
    }
  }
    
  public func getInternalIP(result: @escaping FlutterResult) {
    var address: String!
    var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
    
    if getifaddrs(&ifaddr) == 0 {
        var ptr = ifaddr
        while ptr != nil {
            defer { ptr = ptr?.pointee.ifa_next }
            
            let interface = ptr?.pointee
            let addrFamily = interface?.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                
                let name: String = String(cString: (interface!.ifa_name))
                
                if  name == "en0" || name == "en2" || name == "en3" || name == "en4" || name == "pdp_ip0" || name == "pdp_ip1" || name == "pdp_ip2" || name == "pdp_ip3" {
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                    
                    let temp = String(cString: hostname)
                    
                    if(temp.contains("fe80::")){
                        print(temp)
                    } else {
                        address = temp
                    }
                }
            }
        }
        freeifaddrs(ifaddr)
    }
    result(address)
  }
    
    
    public func getExternalIP(result: @escaping FlutterResult) {
        var address: String?
        dispatchQueue.async {
            self.dispatchGroup.enter()
            Ipify.getPublicIPAddress { result in
                switch result {
                case .success(let ip):
                    print(ip)
                    address = ip
                    self.dispatchGroup.leave()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    address = ""
                    self.dispatchGroup.leave()
                }
            }
            
            self.dispatchGroup.wait(timeout: .distantFuture)
            result(address ?? "")
        }
    }
    
    public func getNetworkType() -> String {
        var type: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }
                
                let interface = ptr?.pointee
                let addrFamily = interface?.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    
                    let wifi = ["en0"]
                    let wired = ["en2", "en3", "en4"]
                    let cellular = ["pdp_ip0","pdp_ip1","pdp_ip2","pdp_ip3"]
                    
                    let name: String = String(cString: (interface!.ifa_name))
                    
                    if (wifi.contains(name)) { type = "wifi" }
                    
                    if (wired.contains(name)) { type = "wired" }
                    
                    if (cellular.contains(name)) { type = "cellular" }
                }
            }
            freeifaddrs(ifaddr)
        }
        return type ?? ""
    }
}
