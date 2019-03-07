//
//  AuthClient.swift
//  MivaOrders
//
//  Created by Mark Tapia on 3/1/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct AuthClient {
    let messageData: Data
    let apiKey: String
    let hmacIsEnabled: Bool
    let signatureKey: String?
    
    func getAuthToken() -> String {
        let authType = hmacIsEnabled ? "MIVA-HMAC-SHA1" : "MIVA"
        //TODO: Set signature key from CoreData store
        let hmacSignature = hmacIsEnabled ? getHmacSignature() : ""
        
        return "\(authType) \(apiKey)\(hmacSignature)"
    }
    
    //MARK: HMAC Signature
    func getHmacSignature() -> String {
        guard let signatureKey = signatureKey else {
            return ""
        }
        //TODO: If hmac set up, return encoded hash. Else, return nil
        let messageString = String(data: messageData, encoding: .utf8)!
        //Base64 Decode Signature Key
        let decodedKey = getDecodedKey(encodedKeyString: signatureKey)
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

extension String {
    func base64lengthCorrected() -> String {
        return self.padding(toLength: ((self.count+3)/4)*4,
                            withPad: "=",
                            startingAt: 0)
    }
}
