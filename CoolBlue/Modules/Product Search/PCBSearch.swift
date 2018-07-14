//
//  PCBSearch.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//
//  Template generated for HungerStation Viper Modules
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

}
