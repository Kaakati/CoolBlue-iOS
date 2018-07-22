//
//  ICBProductDetails.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

class ICBProductDetails: ICBProductDetailsProtocol {
    
    var mainEntity: ECBProductDetails!
    
    var accessories: [ECBProductDetailsAccessory] = [] {
        didSet {
            if accessories.count == mainEntity.recommendedAccessories.count {
                mainEntity.accessories = accessories
                presenter.interactor(self, didFetch: mainEntity)
            }
        }
    }
    
    var presenter: PCBProductDetailsProtocol!
    
    func fetch(productsWithId id: Int, for presenter: PCBProductDetailsProtocol) {
        self.presenter = presenter
        Product.details(forId: id) { (result) in
            switch result {
            case .success(let productNode):
                let entity = self.map(model: productNode.product)
                self.mainEntity = entity
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
        ecbProductDetail.usps = model.usps ?? []
        ecbProductDetail.specs = model.specificationSummary
        ecbProductDetail.price = model.salesPriceIncVat?.string ?? 0.string
        ecbProductDetail.nextDayDelivery = model.availabilityState?.asString ?? ""
        ecbProductDetail.totalRating = String(describing: model.reviewInformation?.reviewSummary?.count ?? 0) + " Reviews"
        ecbProductDetail.promoText = model.promoText ?? ""
        ecbProductDetail.images = model.productImages ?? []
        ecbProductDetail.rating = model.reviewInformation?.reviewSummary?.average ?? 0.0
        ecbProductDetail.recommendedAccessories = model.recommendedAccessories ?? []
        ecbProductDetail.accessories = []
        for i in ecbProductDetail.recommendedAccessories {
            getAccessoriesForItem(id: i)
        }
        return ecbProductDetail
    }
    
    fileprivate func map(accessory: Product) -> ECBProductDetailsAccessory  {
        return ECBProductDetailsAccessory(id: accessory.id ?? 0, name: accessory.name ?? "", image: accessory.productImages?.first ?? "")
    }
    
    fileprivate func getAccessoriesForItem(id: Int) {
        Product.details(forId: id) { (result) in
            switch result {
            case .success(let productNode):
                let accessory = self.map(accessory: productNode.product)
                self.accessories.append(accessory)
            case .failure:
                break
            }
        }
    }
}
