//
//  ICBProductDetails.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

class ICBProductDetails: ICBProductDetailsProtocol {
    
    var accessoriesIds = [Int]()
    var accessories = [ECBProductDetails]()
    
    func fetch(productsWithId id: Int, for presenter: PCBProductDetailsProtocol) {
        DispatchQueue.main.async {
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
    }
    
    /// Map Response Model to Entity
    fileprivate func map(model: Product) -> ECBProductDetails {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
//        longRunningFunction { dispatchGroup.leave() }
        
        dispatchGroup.enter()
//        longRunningFunctionTwo { dispatchGroup.leave() }
        
        dispatchGroup.notify(queue: .main) {
            print("Both functions complete 👍")
        }
        
//        var success1 = false
//        var success2 = false
//
//        //For the first api call
//        DispatchQueue.main.async {
//            success1 = true
//            successCode()
//        }
//
//        //For the second api call
//        DispatchQueue.main.async {
//            success2 = true
//            successCode()
//        }
//
//        func successCode() {
//            if ((success1 == true) && (success2 == true)) {
//                //
//            }
//        }
        
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
        
        self.accessoriesIds = ecbProductDetail.recommendedAccessories ?? []
        
        for item in ecbProductDetail.recommendedAccessories {
//            self.getAccessoriesForItem(with: item)
        }
        
//        ecbProductDetail.accessories = self.accessories
        
        return ecbProductDetail
    }
    
    fileprivate func getAccessoriesForItem(with id: Int) {
        DispatchQueue.main.async {
            Product.details(forId: id) { (result) in
                switch result {
                case .success(let productNode):
                    self.accessories.append(self.map(model: productNode.product))
                    break
                case .failure:
                    break
                }
            }
        }
    }
    
}
