//
//  AuthClient.swift
//  MivaOrders
//
//  Created by Mark Tapia on 3/1/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct AuthClient {
    private let messageData: Data
    private let key: String?
    
    init(messageData: Data) {
        self.messageData = messageData
        //TODO: Get key from CoreData
        self.key = "cG6+9NUT7n5+rvw0lLsl4eq3OnKF2AT02ceAKNOWkFU"
    }
    
    func getAuthToken() -> String {
        //TODO: Find from core data if HMAC is turned on
        let hmacIsEnabled = true
        let authType = hmacIsEnabled ? "MIVA-HMAC-SHA1" : "MIVA"
        //TODO: Set API Key from CoreData store
        let apiKey = getAPIKey()
        //TODO: Set signature key from CoreData store
        let hmacSignature = getHmacSignature()
        
        return "\(authType) \(apiKey)\(hmacSignature)"
    }
    
    private func getAPIKey() -> String {
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
    
    //MARK: HMAC Signature
    func getHmacSignature() -> String {
        guard let key = key else {
            return ""
        }
        //TODO: If hmac set up, return encoded hash. Else, return nil
        let messageString = String(data: messageData, encoding: .utf8)!
        //Base64 Decode Signature Key
        let decodedKey = getDecodedKey(encodedKeyString: key)
        let requestBodyHmacHashData = messageString.hmac(algorithm: .sha1, key: decodedKey)
        //Base64 Encode hash
        let base64EncodedHmacString = ":" + requestBodyHmacHashData.base64EncodedString()
        
        return base64EncodedHmacString
    }
}

extension AuthClient {
    private func getDecodedKey(encodedKeyString: String) -> [UInt8] {
        let lengthCorrectedKey = encodedKeyString.base64lengthCorrected()
        let decodedKey = Data(base64Encoded: lengthCorrectedKey)!
        return [UInt8](decodedKey)
    }
}
