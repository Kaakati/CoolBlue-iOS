//
//  VCBProductDetails.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//
//  Template generated for HungerStation Viper Modules
//

import UIKit

class VCBProductDetails: UIViewController {

	fileprivate let ui = VCBProductDetailsUI()
	fileprivate var presenter: PCBProductDetailsProtocol!

	override func loadView() {
		ui.delegate = self
		ui.dataSource = self
		view = ui
  }

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PCBProductDetails(view: self)
        self.title = "Product Details"
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
//        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.appTheme.colors.BlueLight

    }

}

extension VCBProductDetails: VCBProductDetailsProtocol {

}

extension VCBProductDetails: VCBProductDetailsUIDelegate {

}

extension VCBProductDetails: VCBProductDetailsUIDataSource {

}
