//
//  RelatedProductCollectionViewCell.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 16/07/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit

class RelatedProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDetails: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productOldPrice: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDetailsContainer: UIView!
    
    var item: RelatedProductItem! {
        didSet {
            productName.text = item.title
            productDetails.text = item.details
            productImage.image = item.image
            productDetailsContainer.isHidden = item.isCategory
            if let oldPrice = item.oldPrice, !oldPrice.isEmpty {
                let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: oldPrice)
                attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                productOldPrice.attributedText = attributeString
                productPrice.textColor = .red
            }
            else {
                productOldPrice.attributedText = nil
                productPrice.textColor = .lightGray
            }
            productPrice.text = item.price
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
}
