//
//  CBSearchTableViewCell.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 20/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

class CBSearchTableViewCell : UITableViewCell {
    
    let cellUI = CBSearchCellUI()
    
    var product : ECBSearch? {
        didSet {
            cellUI.product = product
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(cellUI)
        self.selectionStyle = .none
        self.backgroundColor = UIColor.appTheme.colors.LightGray
        cellUI.setBottomBorder()
        cellUI.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 5, rightConstant: 10, widthConstant: 0, heightConstant: 0)
    }
    
}
