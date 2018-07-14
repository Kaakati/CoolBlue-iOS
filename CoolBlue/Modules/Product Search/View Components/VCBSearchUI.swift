//
//  
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//
//  Template generated for HungerStation Viper Modules
//

import UIKit


protocol VCBSearchUIDelegate {

}

protocol VCBSearchUIDataSource {

}

class VCBSearchUI: UIView {
    
    var delegate: VCBSearchUIDelegate?
    var dataSource: VCBSearchUIDataSource?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }

    fileprivate func setupUIElements() {
        // arrange subviews
    }

    fileprivate func setupConstraints() {
        // add constraints to subviews
    }
}
