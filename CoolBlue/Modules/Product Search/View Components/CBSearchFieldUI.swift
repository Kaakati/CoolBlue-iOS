//
//  SearchFieldUI.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 7/21/18.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

class CBSearchFieldUI : UIView {
    
    let searchField : UITextField = {
        let tf = UITextField()
        tf.addPaddingLeft(15)
        tf.placeholder = "Search for products"
        tf.backgroundColor = UIColor.white
        tf.layer.borderWidth = 1
        tf.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.thin)
        tf.layer.borderColor = UIColor.appTheme.colors.DarkGray?.cgColor
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        self.backgroundColor = UIColor.appTheme.colors.BlueLight
        self.addSubview(searchField)
        searchField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchField.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
    }
}
