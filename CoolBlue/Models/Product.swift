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
    var salesPriceIncVat : Int?
    var salesPriceExVat : Int?
    var productImages : [String]?
    var deliveredWith : [String]?
    var specificationSummary : [Specification]?
    var nextDayDelivery : Bool?
    var recommendedAccessories : [Int]?
}

extension Product {
    
    /// Query for Products with Paging
    static func search(query: String, page: Int, completion: @escaping APIResponse<Product>) {
        CBRouter.product.search(query: query, page: page).request(completion: completion)
    }
    
    /// Fetch Product Details from Instance
    func details(completion: @escaping APIResponse<Product>) {
        guard let id = self.id else { return }
        CBRouter.product.details(id: id).request(completion: completion)
    }
    
}
