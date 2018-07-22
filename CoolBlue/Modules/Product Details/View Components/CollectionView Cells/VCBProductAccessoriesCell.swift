//
//  VCBProductAccessoriesCell.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 22/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit

class VCBProductAccessoriesCell : UICollectionViewCell {
    
    let vStackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 3
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .white
        iv.image = UIImage(named: "")
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let title : UILabel = {
        let lbl = UILabel()
        lbl.text = "Item Label"
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
        self.addSubview(vStackView)
        vStackView.addArrangedSubview(imageView)
        vStackView.addArrangedSubview(title)
        vStackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
    }
}
