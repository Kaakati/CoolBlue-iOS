//
//  
//  CoolBlue
//
//  Created Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit
import SwifterSwift

protocol VCBSearchUIDelegate {
    func view(_ view: VCBSearchUI, didSelect product: ECBSearch)
}

protocol VCBSearchUIDataSource {
    func productsFor(view: VCBSearchUI) -> [ECBSearch]
}

class VCBSearchUI: UIView {
    
    fileprivate var cellID = "searchUITableViewCell"
    
    fileprivate var products : [ECBSearch]?
    
    var delegate : VCBSearchUIDelegate?
    var dataSource : VCBSearchUIDataSource?
    
    lazy var tableHeader = CBSearchFieldUI()
    
    lazy var tableView : UITableView = {
        let tbl = UITableView()
        tbl.delegate = self
        tbl.dataSource = self
        tbl.separatorColor = .clear
        tbl.backgroundColor = UIColor.appTheme.colors.LightGray
        tbl.register(CBSearchTableViewCell.self, forCellReuseIdentifier: cellID)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
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
        self.addSubview(tableView)
        tableView.tableHeaderView = tableHeader
    }

    fileprivate func setupConstraints() {
        // add constraints to subviews
        tableView.tableHeaderView?.height = 50
        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func reloadData() {
        self.products = dataSource?.productsFor(view: self)
        self.tableView.reloadData()
    }
}

extension VCBSearchUI: UITableViewDataSource {
    // Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number for Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // An approach to safer UITableViewCell and UICollectionViewCell reuse
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? CBSearchTableViewCell else {
            fatalError("Misconfigured cell!")
        }
        cell.product = self.products?[indexPath.row]
        return cell
    }
    
}

extension VCBSearchUI: UITableViewDelegate {
    // Height For Row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.view(self, didSelect: products![indexPath.row])
    }
}
