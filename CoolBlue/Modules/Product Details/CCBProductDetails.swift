//
//  CCBProductDetails.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol RCBProductDetailsProtocol {

}

//MARK: Presenter -
protocol PCBProductDetailsProtocol {
    
    // Fetch Products for View
    func fetch(productWithId id: Int, for view: VCBProductDetailsProtocol)
    
    // Interactor Will Inform the Presenter of the new products
    func interactor(_ interactor: ICBProductDetailsProtocol, didFetch product: ECBProductDetails)
    
    // Interactor Will Inform the Presenter of the fail fetch.
    func interactor(_ interactor: ICBProductDetailsProtocol, didFailToFetch error: CBError)
    
}

//MARK: Interactor -
protocol ICBProductDetailsProtocol {

    // Fetch Products for Presenter
    // Will Implement PCBSearchProtocol interactor function
    func fetch(productsWithId id: Int, for presenter: PCBProductDetailsProtocol)
    
}

//MARK: View -
protocol VCBProductDetailsProtocol: class, BaseViewProtocol {
    
    // Presenter will inform the view to set new product
    func shouldSet(product: ECBProductDetails)
    
}
