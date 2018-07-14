//
//  Availability.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

// Ask for availabilityState cases
enum Availability : Int, Codable  {
    case comingSoon
    case inStock
    case outOfStock
    
    /// Returns Availability State as a string value
    var asString : String {
        switch self {
        case .comingSoon:
            return "Coming Soon"
        case .inStock:
            return "In Stock"
        case .outOfStock:
            return "Out of Stock"
        }
    }
}
