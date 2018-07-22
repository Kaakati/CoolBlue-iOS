//
//  VCBProductAccessoriesCell.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 22/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit
import Kingfisher

class VCBProductAccessoriesCell : UICollectionViewCell {
    
    var accessory : ECBProductDetailsAccessory! {
        didSet {
            let imgURL = URL(string: accessory.image)
            imageView.kf.setImage(with: imgURL)
            title.text = accessory.name
        }
    }
    
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
        iv.image = UIImage(named: "")
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let title : UILabel = {
        let lbl = UILabel()
        lbl.text = "Item Label"
        lbl.textColor = UIColor.appTheme.colors.BlueLight
        lbl.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
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
        self.backgroundColor = .white
        self.addSubview(vStackView)
        self.layer.borderColor = UIColor.appTheme.colors.LightGray?.cgColor
        self.layer.borderWidth = 1
        vStackView.addArrangedSubview(imageView)
        vStackView.addArrangedSubview(title)
        title.heightAnchor.constraint(equalToConstant: 20).isActive = true
        vStackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
    }
}
