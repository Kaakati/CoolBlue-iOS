//
//  BaseViewProtocol.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit
import SKActivityIndicatorView

protocol BaseViewProtocol {
    
    var viewController : UIViewController { get }
    
    func startLoading()
    func stopLoading()
}


extension BaseViewProtocol where Self: UIViewController {
    
    var viewController : UIViewController {
        return self
    }
    
    func startLoading() {
        SKActivityIndicator.show()
    }
    func stopLoading() {
        SKActivityIndicator.dismiss()
    }
    
}

