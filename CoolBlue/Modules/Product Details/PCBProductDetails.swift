//
//  PCBProductDetails.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//
//  Template generated for HungerStation Viper Modules
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

}
