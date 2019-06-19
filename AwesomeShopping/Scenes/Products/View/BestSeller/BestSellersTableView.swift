//
//  ProductListTableViewController.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 19/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit

class BestSellersTableView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    var products: [BestSeller] = [] {
        didSet {
            tableView.reloadData()
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.registerNibCell(cellType: BestSellerItemTableViewCell.self)
    }
}

extension BestSellersTableView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BestSellerItemTableViewCell = tableView.dequeueReusableCell()
        cell.product = products[indexPath.row]
        return cell
    }
}
