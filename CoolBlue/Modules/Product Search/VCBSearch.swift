//
//  VCBSearch.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

class VCBSearch: UIViewController {
    
    fileprivate var products : [ECBSearch] = []
    
    fileprivate let ui = VCBSearchUI()
    fileprivate var presenter: PCBSearchProtocol!
    
    override func loadView() {
        ui.delegate = self
        ui.dataSource = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Products"
        presenter = PCBSearch(view: self)
        presenter.fetch(productsWithQuery: "", for: self)
    }
    
}

extension VCBSearch: VCBSearchProtocol {
    
    func shouldAppend(products: [ECBSearch]) {
        self.products.append(contentsOf: products)
        DispatchQueue.main.async {
            self.ui.reloadData()
        }
    }
    
    func shouldEmptyProductsList() {
        self.products.removeAll()
    }
    
}

extension VCBSearch: VCBSearchUIDelegate {
    
    func view(_ view: VCBSearchUI, didSelect product: ECBSearch) {
        presenter.view(self, didSelectProduct: product)
    }
    
}

extension VCBSearch: VCBSearchUIDataSource {
    
    func productsFor(view: VCBSearchUI) -> [ECBSearch] {
        return self.products
    }
    
}
