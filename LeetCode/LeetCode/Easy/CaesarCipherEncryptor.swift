//
//  CaesarCipherEncryptor.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/5/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
class CaesarCipherEncryptor {
  func caesarCipherEncryptor(string: String, key: UInt32) -> String {
    var newString = String()
    for (_, character) in string.enumerated(){
        var value: UInt32 = UInt32(character.asciiValue ?? 0) + (key % 26)
        if value > 122 {
            value = value - 97
        }
        print(key)
        newString.append(Character(UnicodeScalar(value)!))
    }
    return newString
  }
}
