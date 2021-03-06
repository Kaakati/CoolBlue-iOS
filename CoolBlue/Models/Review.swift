//
//  Review.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

struct Review : Codable  {
    var id : Int?
    var pros : [String]?
    var cons : [String]?
    var creationDate : String?
    var creatorName : String?
    var description : String?
    var title : String?
    var rating : Float?
    var languageCode : String?
    
    enum CodingKeys : String, CodingKey {
        case id = "reviewId"
        case pros
        case cons
        case creationDate
        case creatorName
        case description
        case title
        case rating
        case languageCode
    }
    
}
