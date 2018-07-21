//
//  Product.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

struct Product : Codable {
    var id : Int?
    var name : String?
    var text : String?
    var reviewInformation : ReviewInformation?
    var usps : [String]?
    var pros : [String]?
    var cons : [String]?
    var availabilityState : Availability?
    var salesPriceIncVat : Double?
    var salesPriceExVat : Double?
    var productImages : [String]?
    var deliveredWith : [String]?
    var specificationSummary : [Specification]?
    var nextDayDelivery : Bool?
    var recommendedAccessories : [Int]?
    
    // Aditional for Search Model
    var image : String?
    var promoText : String?
    var promoIcon : PromoIcon?
    
    enum CodingKeys : String, CodingKey {
        case id = "productId"
        case name = "productName"
        case text = "productText"
        case usps = "USPs"
        case reviewInformation = "reviewInformation"
        case cons
        case pros
        case availabilityState
        case salesPriceIncVat
        case salesPriceExVat
        case productImages
        case deliveredWith
        case specificationSummary = "specificationSummary"
        case nextDayDelivery
        case recommendedAccessories
        
        case image = "productImage"
        case promoText = "coolbluesChoiceInformationTitle"
        case promoIcon = ""
    }
}

extension Product {
    
    /// Query for Products with Paging
    static func search(query: String, page: Int, completion: @escaping APIResponse<SearchNode>) {
        CBRouter.product.search(query: query, page: page).request(completion: completion)
    }
    
    /// Fetch Product Details from Instance
    static func details(forId id: Int, completion: @escaping APIResponse<DetailsNode>) {
//        guard let id = self.id else { return }
        CBRouter.product.details(id: id).request(completion: completion)
    }
    
}
