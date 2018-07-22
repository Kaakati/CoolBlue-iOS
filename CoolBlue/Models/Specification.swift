//
//  Specification.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation
import SwifterSwift

//enum BooleanValue : Int, Codable {
//    case trueValue = 1
//    case falseValue = 0
//
//    var asString : String {
//        switch self {
//        case .trueValue:
//            return "Yes"
//        case .falseValue:
//            return "No"
//        }
//    }
//}

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
        if let boolValue = try? values.decode(Bool.self, forKey: .booleanValue) {
            self.booleanValue = boolValue
        } else {
            self.booleanValue = false // Set default false for bool value if nil.
        }
        
        // Unexpected Value from API Call
        do {
            self.value = try values.decode(String.self, forKey: .value)
        } catch DecodingError.typeMismatch {
            // There was something for the "value" key, but it wasn't a String value. Try a Bool.
            if let boolValue = try values.decodeIfPresent(Bool.self, forKey: .value) {
                self.value = boolValue.description
            }
        }
    }

}
