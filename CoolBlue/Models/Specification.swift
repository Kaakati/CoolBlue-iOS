//
//  Specification.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

// Product Specifications
struct Specification : Codable  {
    
    var name : String?
    var value : String?
    var stringValue : String?
    var booleanValue : Bool?
    
    enum CodingKeys : String, CodingKey {
        case name
        case value
        case stringValue
        case booleanValue
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try? values.decode(String.self, forKey: .name)
        stringValue = try? values.decode(String.self, forKey: .stringValue)
        booleanValue = try? values.decode(Bool.self, forKey: .stringValue)

        do {
            self.value = try? values.decode(String.self, forKey: .value)
        } catch DecodingError.typeMismatch {
            // There was something for the "value" key, but it wasn't a String value. Try a Bool.
            if let boolValue = try values.decodeIfPresent(Bool.self, forKey: .value) {
                // Can check for "parent" specifically if you want.
                self.value = boolValue.string
            }
        }
    }

}
