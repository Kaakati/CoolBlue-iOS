//
//  ICBProductDetails.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

class ICBProductDetails: ICBProductDetailsProtocol {
    
    func fetch(productsWithId id: Int, for presenter: PCBProductDetailsProtocol) {
        Product.details(forId: id) { (result) in
            switch result {
            case .success(let productNode):
                presenter.interactor(self, didFetch: self.map(model: productNode.product))
                break
            case .failure:
                break
            }
        }
    }
    
    /// Map Response Model to Entity
    fileprivate func map(model: Product) -> ECBProductDetails {
        var ecbProductDetail = ECBProductDetails()
        ecbProductDetail.id = model.id ?? 0
        ecbProductDetail.name = model.name ?? ""
//        ecbProductDetail.image = model.image ?? ""
        ecbProductDetail.price = model.salesPriceIncVat?.string ?? 0.string
        ecbProductDetail.nextDayDelivery = model.availabilityState?.asString ?? ""
        ecbProductDetail.totalRating = String(describing: model.reviewInformation?.reviewSummary?.count ?? 0) + " Reviews"
        ecbProductDetail.promoText = model.promoText ?? ""
//        ecbProductDetail.promoIcon = UIImage(named: model.promoIcon?.text ?? "")
        ecbProductDetail.usps = model.usps ?? []
        ecbProductDetail.rating = model.reviewInformation?.reviewSummary?.average ?? 0.0
        return ecbProductDetail
    }
    
}
