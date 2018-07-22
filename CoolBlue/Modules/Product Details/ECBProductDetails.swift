//
//  ECBProductDetails.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

struct ECBProductDetails {
    
    var id : Int = 0
    var name : String = "Product Name"
    var promoText : String = ""
    var rating : Float = 0.0
    var totalRating : String = "0"
    var usps : [String] = []
    var price : String = ""
    var nextDayDelivery : String = "Next Day Delivery"
    var images : [String]?
    var specs : [Specification]?
    var recommendedAccessories : [Int] = []
    var accessories : [ECBProductDetailsAccessory] = []
}


struct ECBProductDetailsAccessory {
    
    var id : Int = 0
    var name : String = "Product Name"
    var image : String = ""
    
}
