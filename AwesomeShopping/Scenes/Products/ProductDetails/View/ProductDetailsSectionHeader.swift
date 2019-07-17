//
//  ProductDetailsSectionHeader.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 17/07/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit

class ProductDetailsSectionHeader: UITableViewHeaderFooterView, Reusable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingsView: UIView!
    
    func configure(with title: String, showRatings: Bool) {
        titleLabel.text = title
        ratingsView.isHidden = !showRatings
    }

}
