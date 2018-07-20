//
//  ReviewSummary.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

struct ReviewSummary : Codable  {
    var average : Float?
    var count : Int?
    
    enum CodingKeys : String, CodingKey {
        case average = "reviewAverage"
        case count = "reviewCount"
    }
}
