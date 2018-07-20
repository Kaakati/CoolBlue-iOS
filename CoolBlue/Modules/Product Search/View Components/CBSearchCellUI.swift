//
//  CBSearchCellUI.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 20/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit
import SwifterSwift
import Kingfisher
import AARatingBar

class CBSearchCellUI : UIView {
    
    var product : ECBSearch? {
        didSet {
            guard let product = self.product else { return }
            
            // Set Values
            let imgURL = URL(string: product.image)
            productImage.kf.setImage(with: imgURL)
            productTitle.text = product.name
            productReviewStars.value = product.rating.cgFloat - 5
            productReviews.text = product.totalRating
            productPrice.text = product.price
            productDelivery.text = product.nextDayDelivery
            
            let usps = product.usps
            
            productSpecsOne.text = "• \(usps.item(at: 0)!)"
            productSpecsTwo.text = "• \(usps.item(at: 1)!)"
            productSpecsThree.text = "• \(usps.item(at: 2)!)"
            
            let promoIconURL = URL(string: "https://assets.coolblue.nl/images/default/coolblues-choice/label-right_nl.png")
            productPromoImage.kf.setImage(with: promoIconURL)
            
            updateConstraints()
            updateConstraintsIfNeeded()
            layoutIfNeeded()
            layoutSubviews()
        }
    }
    
    let hStackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 3
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let productImage : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let vStackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 3
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let productTitle : UILabel = {
        let lbl = UILabel()
        lbl.text = "This is the Product Title"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.appTheme.colors.BlueLight
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let hRatingStackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 3
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let productReviewStars : AARatingBar = {
        let rs = AARatingBar()
        rs.color = UIColor.black
        rs.maxValue = 5
        rs.value = 0
        rs.isEnabled = false
        rs.sizeToFit()
        rs.backgroundColor = .clear
        rs.translatesAutoresizingMaskIntoConstraints = false
        return rs
    }()
    
    let productReviews : UILabel = {
        let lbl = UILabel()
        lbl.text = "308 Reviews"
        lbl.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let productSpecsOne : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let productSpecsTwo : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let productSpecsThree : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let productPrice : UILabel = {
        let lbl = UILabel()
        lbl.text = "Product Price"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let productDelivery : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textColor = UIColor.appTheme.colors.Green
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let productPromoImage : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
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
        self.addSubview(productPromoImage)
        self.backgroundColor = UIColor.white
        hStackView.addArrangedSubview(productImage)
        hStackView.addArrangedSubview(vStackView)
        
        
        productImage.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 0.4) - 30).isActive = true
        productTitle.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 0.5)).isActive = true

        vStackView.addArrangedSubview(productTitle)
        vStackView.addArrangedSubview(hRatingStackView)
        
        hRatingStackView.addArrangedSubview(productReviewStars)
        hRatingStackView.addArrangedSubview(productReviews)
        
        vStackView.addArrangedSubview(productSpecsOne)
        vStackView.addArrangedSubview(productSpecsTwo)
        vStackView.addArrangedSubview(productSpecsThree)
        vStackView.addArrangedSubview(productPrice)
        vStackView.addArrangedSubview(productDelivery)
        
        productTitle.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        productReviewStars.widthAnchor.constraint(equalToConstant: 75).isActive = true
        productReviewStars.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        hStackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        productPromoImage.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 10, rightConstant: 0, widthConstant: 75, heightConstant: 50)
    }
}
