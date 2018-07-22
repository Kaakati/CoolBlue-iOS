//
//  SpecificationsUI.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 7/22/18.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

class SpecificationUI: UIView {
    
    let hStackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 3
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    var title : UILabel = {
        let lbl = UILabel()
        lbl.text = "Specs Title"
        lbl.numberOfLines = 1
        lbl.lineBreakMode = .byTruncatingTail
        lbl.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        lbl.textColor = UIColor.appTheme.colors.BlueLight
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var value : UILabel = {
        let lbl = UILabel()
        lbl.text = "Specs Value"
        lbl.numberOfLines = 1
        lbl.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(hStackView)
        
        title.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.4).isActive = true
        
        hStackView.addArrangedSubview(title)
        hStackView.addArrangedSubview(value)
        
        hStackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
    }
    
}
