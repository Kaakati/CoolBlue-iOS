//
//  VCBProductDetails.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

class VCBProductDetails: UIViewController {
    
    private var productParams : Int?
    
	fileprivate let ui = VCBProductDetailsUI()
	fileprivate var presenter: PCBProductDetailsProtocol!
    
    fileprivate var product : ECBProductDetails = ECBProductDetails()
    
	override func loadView() {
		ui.delegate = self
		ui.dataSource = self
		view = ui
    }
    
    private convenience init() {
        self.init(productId : 0)
    }
    
    init(productId : Int) {
        super.init(nibName: nil, bundle: nil)
        self.productParams = productId
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PCBProductDetails(view: self)
        self.title = "Product Details"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.appTheme.colors.BlueLight
        presenter.fetch(productWithId: productParams ?? 0, for: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.appTheme.colors.BlueLight
    }

}

extension VCBProductDetails: VCBProductDetailsProtocol {
    
    func shouldSet(product: ECBProductDetails) {
        self.product = product
        DispatchQueue.main.async {
            self.ui.reloadData()
        }
    }
    

}

extension VCBProductDetails: VCBProductDetailsUIDelegate {

}

extension VCBProductDetails: VCBProductDetailsUIDataSource {
    func productFor(view: VCBProductDetailsUI) -> ECBProductDetails {
        return self.product
    }
    

}
