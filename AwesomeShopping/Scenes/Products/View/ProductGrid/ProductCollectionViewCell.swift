//
//  ProductCollectionViewCell.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 02/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var product: SectionProduct! {
        didSet {
            titleLabel.text = product.name
            productImage.image = UIImage(named: product.imageName ?? "")
        }
    }
    
}
