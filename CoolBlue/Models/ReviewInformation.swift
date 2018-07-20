//
//  ReviewInformation.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

struct ReviewInformation : Codable  {
    var reviews : [Review]?
    var reviewSummary : ReviewSummary?
    
    enum CodingKeys : String, CodingKey {
        case reviews
        case reviewSummary
    }
}
