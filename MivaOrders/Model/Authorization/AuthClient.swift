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
    let signatureIsEnabled: Bool
    let signatureKey: String?
    
    func getAuthToken() -> String {
        let authType = signatureIsEnabled ? "MIVA-HMAC-SHA1" : "MIVA"
        let hmacSignature = signatureIsEnabled ? getHmacSignature() : ""
        
        let authToken = "\(authType) \(apiKey)\(hmacSignature)"
        print(authToken)
        return authToken
    }
    
    //MARK: HMAC Signature
    private func getHmacSignature() -> String {
        guard let signatureKey = signatureKey else {
            return ""
        }

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
