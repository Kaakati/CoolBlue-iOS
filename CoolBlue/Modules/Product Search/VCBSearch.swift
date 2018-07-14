//
//  VCBSearch.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//
//  Template generated for HungerStation Viper Modules
//

import UIKit

class VCBSearch: UIViewController {

	fileprivate let ui = VCBSearchUI()
	fileprivate var presenter: PCBSearchProtocol!

	override func loadView() {
		ui.delegate = self
		ui.dataSource = self
		view = ui
  }

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PCBSearch(view: self)
  }

}

extension VCBSearch: VCBSearchProtocol {

}

extension VCBSearch: VCBSearchUIDelegate {

}

extension VCBSearch: VCBSearchUIDataSource {

}
