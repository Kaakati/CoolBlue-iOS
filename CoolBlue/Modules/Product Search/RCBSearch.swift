//
//  RCBSearch.swift
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

class RCBSearch: RCBSearchProtocol {
    
    func showProductDetails(with id: Int, from viewController: UIViewController) {
        let productDetails = VCBProductDetails()
        viewController.navigationController?.pushViewController(productDetails, animated: true)
    }
        
}
