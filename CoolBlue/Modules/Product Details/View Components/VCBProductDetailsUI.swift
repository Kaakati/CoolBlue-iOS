//
//  
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit


protocol VCBProductDetailsUIDelegate {

}

protocol VCBProductDetailsUIDataSource {
    func productFor(view: VCBProductDetailsUI) -> ECBProductDetails
}

class VCBProductDetailsUI: UIView, UICollectionViewDelegateFlowLayout {
    
    var product : ECBProductDetails? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    let defaultCellId = "productDefaultCell"
    let productImagesCellID = "productImagesCell"
    let productSpecsCellID = "productSpecsCellID"
    
    lazy var tableView : UITableView = {
        let tbl = UITableView()
        tbl.delegate = self
        tbl.dataSource = self
        tbl.separatorColor = .clear
        tbl.backgroundColor = UIColor.appTheme.colors.LightGray
        tbl.register(UITableViewCell.self, forCellReuseIdentifier: defaultCellId)
        tbl.register(VCBProductImagesCell.self, forCellReuseIdentifier: productImagesCellID)
        tbl.register(VCBProductDetailsSpecsCell.self, forCellReuseIdentifier: productSpecsCellID)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    var delegate: VCBProductDetailsUIDelegate?
    var dataSource: VCBProductDetailsUIDataSource?

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
        self.backgroundColor = UIColor.white
        self.addSubview(tableView)
    }

    fileprivate func setupConstraints() {
        // add constraints to subviews
        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func reloadData() {
        self.product = dataSource?.productFor(view: self)
    }
}

// Table View
extension VCBProductDetailsUI : UITableViewDelegate, UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: // Images Cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: productImagesCellID, for: indexPath) as? VCBProductImagesCell else {
                fatalError("Product Details TableView Cell Failed to Configure.")
            }
            cell.productImages = product?.images ?? []
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: productSpecsCellID, for: indexPath) as? VCBProductDetailsSpecsCell else {
                fatalError("Product Specs TableView Cell Failed to Configure.")
            }
            cell.specificationSummary = product?.specs
            return cell
        default: // Default Cell Style
            let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellId, for: indexPath) as UITableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: // Images Cell
            return 230
        default: // Default Cell Style
            return UITableViewAutomaticDimension
        }
    }
}
