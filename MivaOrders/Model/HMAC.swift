//
//  HMAC.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/26/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

//    kCCHmacAlgSHA1,
//    kCCHmacAlgMD5,
//    kCCHmacAlgSHA256,
//    kCCHmacAlgSHA384,
//    kCCHmacAlgSHA512,
//    kCCHmacAlgSHA224
enum HmacAlgorithm {
    case sha1, md5, sha256, sha384, sha512, sha224
    var algorithm: CCHmacAlgorithm {
        switch self {
        case .sha1:
            return CCHmacAlgorithm(kCCHmacAlgSHA1)
        case .md5:
            return CCHmacAlgorithm(kCCHmacAlgMD5)
        case .sha256:
            return CCHmacAlgorithm(kCCHmacAlgSHA256)
        case .sha384:
            return CCHmacAlgorithm(kCCHmacAlgSHA384)
        case .sha512:
            return CCHmacAlgorithm(kCCHmacAlgSHA512)
        case .sha224:
            return CCHmacAlgorithm(kCCHmacAlgSHA224)
        }
    }
    var digestLength: Int {
        switch self {
        case .sha1:
            return Int(CC_SHA1_DIGEST_LENGTH)
        case .md5:
            return Int(CC_MD5_DIGEST_LENGTH)
        case .sha256:
            return Int(CC_SHA256_DIGEST_LENGTH)
        case .sha384:
            return Int(CC_SHA384_DIGEST_LENGTH)
        case .sha512:
            return Int(CC_SHA512_DIGEST_LENGTH)
        case .sha224:
            return Int(CC_SHA224_DIGEST_LENGTH)
        }
    }
}

extension String {
    
    func hmac(algorithm: HmacAlgorithm, key: [UInt8]) -> String {
        let str = self.cString(using: .utf8)
        let strLen = Int(self.lengthOfBytes(using: .utf8))
        let digestLen = algorithm.digestLength
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        let keyStr = key
        let keyLen = Int(key.count)
        
        CCHmac(algorithm.algorithm, keyStr, keyLen, str!, strLen, result)
        let digestData = Data(bytes: result, count: algorithm.digestLength)
        let digestString = digestData.base64EncodedString()
        
//        let digest = stringFromResult(result: result, length: digestLen)
        
        result.deallocate()
        
        return digestString
    }
    
    //TODO: Maybe remove this
    private func stringFromResult(result: UnsafeMutablePointer<CUnsignedChar>, length: Int) -> String {
        let hash = NSMutableString()
        for i in 0..<length {
            hash.appendFormat("%02x", result[i])
        }
        return String(hash)
    }
    
}
