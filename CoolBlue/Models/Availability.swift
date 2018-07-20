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
    case availableSoon = 1
    case onStock = 2
    case temporarlyOutOfStock = 3
    case empty = 4
    case permenantlyOutOfStock = 5
    case preOrder = 6

    /// Returns Availability State as a string value
    var asString : String {
        switch self {
        case .availableSoon:
            return "Available Soon"
        case .onStock:
            return "On Stock"
        case .temporarlyOutOfStock:
            return "Temporarly Out of Stock"
        case .empty:
            return "Empty"
        case .permenantlyOutOfStock:
            return "Permenantly Out of Stock"
        case .preOrder:
            return "Pre-Order"
        }
    }
}
