//
//  APIConstants.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/25/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation
import UIKit

struct APIConstants {
    struct UrlComponents {
        static let Scheme = "https"
        static let Host = "dts3211.mivamerchantdev.com"
        static let Path = "/mm5/json.mvc"
    }
        
    struct RequestHeaderKeys {
        static let Host = "Host"
        static let UserAgent = "User-Agent"
        static let ContentType = "Content-Type"
        static let APIAuthToken = "X-Miva-API-Authorization"
        static let Accept = "Accept"
        static let ContentLength = "Content-Length"
    }
    
    struct RequestHeaderValues {
        static let Host = "dts3211.mivamerchantdev.com"
        static let UserAgent = UAString()
        static let ContentType = "application/json"
        //TODO: Hide this and get it from user input
        static let APIAuthToken = "MIVA \(APIKey())"
        static let Accept = "*/*"
        //TODO: Evaluate size of data here
        static let ContentLength = "629"
    }
}

extension APIConstants {
    //MARK: Get API Key
    private static func APIKey() -> String {
        guard let filePath = Bundle.main.path(forResource: "APIKey", ofType: "plist") else {
            fatalError("Check file list for APIKey.plist")
        }
        
        guard let dictionary = NSDictionary(contentsOfFile: filePath) as? [String : String] else {
            fatalError("Could not get contents of file: \(filePath)")
        }
        
        guard let apiKey = dictionary["APIKey"] else {
            fatalError("No value for key \"apiKey\"")
        }
        
        return apiKey
    }
    
    //MARK: Create User Agent String Functions
    //Code borrowed from https://github.com/WURFL/User-Agent-Native-apps/blob/master/swift/UABuilder.swift
    
    private static func UAString() -> String {
        let uaString = "\(appNameAndVersion()) \(deviceName()) \(deviceVersion()) \(CFNetworkVersion()) \(DarwinVersion())"
        print("UAString: \(uaString)")
        return uaString
    }
    
    //eg. Darwin/16.3.0
    private static func DarwinVersion() -> String {
        var sysinfo = utsname()
        uname(&sysinfo)
        let dv = String(bytes: Data(bytes: &sysinfo.release, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
        return "Darwin/\(dv)"
    }
    //eg. CFNetwork/808.3
    private static func CFNetworkVersion() -> String {
        let dictionary = Bundle(identifier: "com.apple.CFNetwork")?.infoDictionary!
        let version = dictionary?["CFBundleShortVersionString"] as! String
        return "CFNetwork/\(version)"
    }
    
    //eg. iOS/10_1
    private static func deviceVersion() -> String {
        let currentDevice = UIDevice.current
        return "\(currentDevice.systemName)/\(currentDevice.systemVersion)"
    }
    //eg. iPhone5,2
    private static func deviceName() -> String {
        var sysinfo = utsname()
        uname(&sysinfo)
        return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
    }
    //eg. MyApp/1
    private static func appNameAndVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let name = dictionary["CFBundleName"] as! String
        return "\(name)/\(version)"
    }
    
}

