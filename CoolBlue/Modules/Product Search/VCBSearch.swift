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
        self.title = ""
        presenter = PCBSearch(view: self)
        presenter.fetch(productsWithQuery: "", for: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
    func view(_ view: VCBSearchUI, didSearch query: String) {
        presenter.fetch(productsWithQuery: query, for: self)
    }
    
    
    func view(_ view: VCBSearchUI, didSelect product: ECBSearch) {
        presenter.view(self, didSelectProduct: product)
    }
    
}

extension VCBSearch: VCBSearchUIDataSource {
    
    func productsFor(view: VCBSearchUI) -> [ECBSearch] {
        return self.products
    }
    
}
