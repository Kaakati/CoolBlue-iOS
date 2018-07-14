//
//  ICBSearch.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//
//  Template generated for HungerStation Viper Modules
//

import UIKit
import SwifterSwift

class ICBSearch: ICBSearchProtocol {
    
    var queryString : String = ""
    var paging : Int = 1
    
    func fetch(productsWithQuery query: String, for presenter: PCBSearchProtocol) {
        //
        queryString = query
        paging = 1
        
        Product.search(query: query, page: paging) { (results) in
            switch results {
            case .success(let products):
                presenter.interactor(self, didFetch: [products])
            case .failure(let error):
                presenter.interactor(self, didFailToFetch: error)
            }
        }
    }
    
    func update(productsFor presenter: PCBSearchProtocol) {
        //
        
        
    }
    
    private func mapModelToEntity(model: Product) -> ECBSearch {
        
        var ecbSearch = ECBSearch()
        ecbSearch.id = model.id ?? 0
        ecbSearch.name = model.name ?? ""
        ecbSearch.image = model.image ?? ""
        ecbSearch.price = model.salesPriceIncVat?.string ?? 0.string
        ecbSearch.nextDayDelivery = model.nextDayDelivery?.string ?? ""
        ecbSearch.rating = model.reviewInformation?.reviewSummary?.count ?? 0
        ecbSearch.promoText = model.promoText ?? ""
        ecbSearch.promoIcon = UIImage(named: "\(model.promoIcon?.text)")
    }

}






