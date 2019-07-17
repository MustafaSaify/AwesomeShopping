//
//  ProductReviewsTableViewCell.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 15/07/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit
import iCarousel

class ProductReviewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carousel: iCarousel!
    
    var reviews: [ProductReview] = [] {
        didSet {
            carousel.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        carousel.bounces = false
        carousel.isPagingEnabled = true
        carousel.type = .linear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ProductReviewsTableViewCell : iCarouselDataSource {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return reviews.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var reviewView: ProductReviewView! = view as? ProductReviewView
        if reviewView == nil {
            reviewView = Bundle.main.loadNibNamed("ProductReviewView", owner: nil, options: nil)?.first as? ProductReviewView
            reviewView.frame = CGRect(x: 0, y: 0, width: carousel.frame.width, height: carousel.frame.height)
        }
        reviewView.review = reviews[index]
        return reviewView
    }
}
