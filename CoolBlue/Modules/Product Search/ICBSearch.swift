//
//  ICBSearch.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit
import SwifterSwift

class ICBSearch: ICBSearchProtocol {
    
    private var presenter : PCBSearchProtocol!
    private var queryString : String = ""
    private var paging : Int = 1
    
    func fetch(productsWithQuery query: String, for presenter: PCBSearchProtocol) {
        self.presenter = presenter
        queryString = query // Reset Query by Presenter.
        paging = 1
        fetchProductsResponse()
    }
    
    /// Next Page Result by User Request
    func update(productsFor presenter: PCBSearchProtocol) {
        paging += 1
        fetchProductsResponse()
    }
    
    /// Call API for Results
    fileprivate func fetchProductsResponse() {
        let isNextPage = paging != 1
        Product.search(query: queryString, page: paging) { (results) in
            switch results {
            case .success(let searchNode):
                let products = searchNode.products.map({ return self.map(model: $0) })
                if isNextPage {
                    self.presenter.interactor(self, didUpdate: products)
                } else {
                    self.presenter.interactor(self, didFetch: products)
                }
            case .failure(let error):
                if isNextPage {
                    self.presenter.interactor(self, didFailToUpdate: error)
                } else {
                    self.presenter.interactor(self, didFailToFetch: error)
                }
            }
        }
    }
    
    /// Map Response Model to Entity
    fileprivate func map(model: Product) -> ECBSearch {
        var ecbSearch = ECBSearch()
        ecbSearch.id = model.id ?? 0
        ecbSearch.name = model.name ?? ""
        ecbSearch.image = model.image ?? ""
        ecbSearch.price = model.salesPriceIncVat?.string ?? 0.string
        ecbSearch.nextDayDelivery = model.availabilityState?.asString ?? ""
        ecbSearch.totalRating = String(describing: model.reviewInformation?.reviewSummary?.count ?? 0) + " Reviews"
        ecbSearch.promoText = model.promoText ?? ""
        ecbSearch.promoIcon = UIImage(named: model.promoIcon?.text ?? "")
        ecbSearch.usps = model.usps ?? []
        ecbSearch.rating = model.reviewInformation?.reviewSummary?.average ?? 0.0
        return ecbSearch
    }
    
}
