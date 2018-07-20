//
//  PCBSearch.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

class PCBSearch {
    
    weak fileprivate var view: VCBSearchProtocol?
    fileprivate var interactor: ICBSearchProtocol
    fileprivate var wireframe: RCBSearchProtocol
    
    init(view: VCBSearchProtocol) {
        self.view = view
        self.interactor = ICBSearch()
        self.wireframe = RCBSearch()
    }
    
}

extension PCBSearch: PCBSearchProtocol {
    
    func fetch(productsWithQuery query: String, for view: VCBSearchProtocol) {
        view.startLoading()
        interactor.fetch(productsWithQuery: query, for: self)
    }
    
    func update(productsFor view: VCBSearchProtocol) {
        view.startLoading()
        interactor.update(productsFor: self)
    }
    
    func view(_ view: VCBSearchProtocol, didSelectProduct product: ECBSearch) {
        // to Details
        wireframe.showProductDetails(with: product.id, from: view.viewController)
    }
    
    func interactor(_ interactor: ICBSearchProtocol, didFetch products: [ECBSearch]) {
        view?.shouldEmptyProductsList()
        view?.stopLoading()
        view?.shouldAppend(products: products)
    }
    
    func interactor(_ interactor: ICBSearchProtocol, didFailToFetch error: CBError) {
        //
        view?.stopLoading()
        //TODO: handle Error show Alert
    }
    
    func interactor(_ interactor: ICBSearchProtocol, didUpdate products: [ECBSearch]) {
        //
        view?.stopLoading()
        view?.shouldAppend(products: products)
    }
    
    func interactor(_ interactor: ICBSearchProtocol, didFailToUpdate error: CBError) {
        //
        view?.stopLoading()
        //TODO: handle Error show Alert
    }
    
}
