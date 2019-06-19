//
//  ProductTableViewCell.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 19/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit

class BestSellerItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDetails: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productOldPrice: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var product: BestSeller! {
        didSet {
            productName.text = product.title
            productDetails.text = product.details
            productImage.image = UIImage(named: product.imageName ?? "")
            if let oldPrice = product.oldPrice, !oldPrice.isEmpty {
                let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: oldPrice)
                attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                productOldPrice.attributedText = attributeString
                productPrice.textColor = .red
            }
            else {
                productOldPrice.attributedText = nil
                productPrice.textColor = .black
            }
            productPrice.text = product.price
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
