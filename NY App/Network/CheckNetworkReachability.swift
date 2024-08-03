//
//  CheckNetworkReachability.swift
//  NY App
//
//  Created by Syed Bilal on 03/08/2024.
//

import Foundation
import Alamofire

class CheckNetworkReachability: NSObject {
    
    static let instance = CheckNetworkReachability()
    
    let reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
    
    var isInternetAvailable: Bool {
        return reachabilityManager?.isReachable ?? false
    }
    
    func startNetworkMonitoring(completion: @escaping NetworkReachabilityManager.Listener) {
        reachabilityManager?.startListening(onUpdatePerforming: { status in
            switch status {
            case .notReachable:
                print("The network is not reachable")
            case .unknown :
                print("It is unknown whether the network is reachable")
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection")
            case .reachable(.cellular):
                print("The network is reachable over the WWAN connection")
            }
            completion(status)
        })
    }
    
}
