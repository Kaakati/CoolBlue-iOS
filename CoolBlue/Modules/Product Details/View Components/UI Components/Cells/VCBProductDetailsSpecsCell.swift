//
//  VCBProductDetailsSpecsCell.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 7/22/18.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import Foundation
import UIKit

class VCBProductDetailsSpecsCell : UITableViewCell {
    
    var specificationSummary : [Specification]? {
        didSet {
            self.updateConstraintsIfNeeded()
            self.setNeedsLayout()
            self.setNeedsDisplay()
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
    
    let cellTitle : UILabel = {
        let lbl = UILabel()
        lbl.text = "Product Specifications"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func didMoveToWindow() {
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(vStackView)
        vStackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        vStackView.addArrangedSubview(cellTitle)
        cellTitle.anchor(top: nil, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        if let specs = specificationSummary {
            for item in specs {
                let specsUI = SpecificationUI()
                specsUI.anchor(top: nil, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
                specsUI.title.text = item.name
                specsUI.value.text = item.value
                vStackView.addArrangedSubview(specsUI)
                self.updateConstraints()
                self.setNeedsLayout()
            }
        }
    }
    
}
