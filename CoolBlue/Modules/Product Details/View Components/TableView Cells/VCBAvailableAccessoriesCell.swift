//
//  VCBAvailableAccessories.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 22/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit
import Kingfisher

class VCBAvailableAccessoriesCell: UITableViewCell, UICollectionViewDelegateFlowLayout {
    
    var productImages : [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let productImagesCellId = "productAccessoriesCellId"
    
    let topBar : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.appTheme.colors.LightGray
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let titleForSection : UILabel = {
        let lbl = UILabel()
        lbl.text = "Recomended Accessories"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        // ... layout parameters
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        let cv = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = UIColor.appTheme.colors.LightGray
        cv.register(VCBProductAccessoriesCell.self, forCellWithReuseIdentifier: productImagesCellId)
        return cv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // Better Add The Views to a Vertical StackView
        self.addSubview(topBar)
        self.addSubview(titleForSection)
        self.addSubview(collectionView)
        topBar.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 10, rightConstant: 0, widthConstant: 0, heightConstant: 10)
        titleForSection.anchor(top: topBar.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 20)
        collectionView.anchor(top: titleForSection.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}

// Collection View
extension VCBAvailableAccessoriesCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9 //productImages!.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: productImagesCellId, for: indexPath) as? VCBProductAccessoriesCell else {
            fatalError("Product Details CollectionView Cell Failed to Configure.")
        }
        
        if productImages != nil {
            let imageURL = URL(string: productImages![indexPath.row])
            item.imageView.kf.setImage(with: imageURL)
        } else {
            let imageURL = URL(string: "https://placeimg.com/800/480/tech") //URL(string: productImages![indexPath.row])
            item.imageView.kf.setImage(with: imageURL)
        }
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width * 0.3), height: 165)
    }
    
}
