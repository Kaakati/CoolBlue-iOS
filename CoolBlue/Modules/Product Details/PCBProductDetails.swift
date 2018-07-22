//
//  PCBProductDetails.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

class PCBProductDetails {

    weak fileprivate var view: VCBProductDetailsProtocol?
    fileprivate var interactor: ICBProductDetailsProtocol
    fileprivate var wireframe: RCBProductDetailsProtocol

    init(view: VCBProductDetailsProtocol) {
        self.view = view
        self.interactor = ICBProductDetails()
        self.wireframe = RCBProductDetails()
    }
}

extension PCBProductDetails: PCBProductDetailsProtocol {
    
    func fetch(productWithId id: Int, for view: VCBProductDetailsProtocol) {
        // Fetch Entity with ID
        view.startLoading()
        interactor.fetch(productsWithId: id, for: self)
    }
    
    func interactor(_ interactor: ICBProductDetailsProtocol, didFetch product: ECBProductDetails) {
        // Set Entity to View
        view?.shouldSet(product: product)
        view?.stopLoading()
    }
    
    func interactor(_ interactor: ICBProductDetailsProtocol, didFailToFetch error: CBError) {
        //
    }
    

}
