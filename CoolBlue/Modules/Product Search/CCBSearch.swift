//
//  CCBSearch.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

//MARK: Wireframe -
protocol RCBSearchProtocol {
    // Perform Route to Product Details
    func showProductDetails(with id: Int, from viewController: UIViewController)
    
}

//MARK: Presenter -
protocol PCBSearchProtocol {

    // Fetch Products for View
    func fetch(productsWithQuery query: String, for view: VCBSearchProtocol)
    
    // Update Products for View *did reach the end of the tableview*
    func update(productsFor view: VCBSearchProtocol)
    
    // View did Select Product
    func view(_ view: VCBSearchProtocol, didSelectProduct product: ECBSearch)
    
    // Interactor Will Inform the Presenter of the new products
    func interactor(_ interactor: ICBSearchProtocol, didFetch products: [ECBSearch])
    
    // Interactor Will Inform the Presenter of the fail fetch.
    func interactor(_ interactor: ICBSearchProtocol, didFailToFetch error: CBError)
    
    // Interactor Will Inform the Presenter of the new products
    func interactor(_ interactor: ICBSearchProtocol, didUpdate products: [ECBSearch])
    
    // Interactor Will Inform the Presenter of the fail fetch.
    func interactor(_ interactor: ICBSearchProtocol, didFailToUpdate error: CBError)
    
}

//MARK: Interactor -
protocol ICBSearchProtocol {
    
    // Fetch Products for Presenter
    // Will Implement PCBSearchProtocol interactor function
    func fetch(productsWithQuery query: String, for presenter: PCBSearchProtocol)
    
    // Update Products for Presenter *did reach the end of the tableview*
    func update(productsFor presenter: PCBSearchProtocol)
    
    
}

//MARK: View -
protocol VCBSearchProtocol: class, BaseViewProtocol {
    
    // Presenter will inform the view to append new products
    func shouldAppend(products: [ECBSearch])
    func shouldEmptyProductsList()
    
}





