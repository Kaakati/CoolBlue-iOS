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
  }

}

extension VCBProductDetails: VCBProductDetailsProtocol {

}

extension VCBProductDetails: VCBProductDetailsUIDelegate {

}

extension VCBProductDetails: VCBProductDetailsUIDataSource {

}
