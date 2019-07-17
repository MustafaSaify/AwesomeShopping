//
//  ProductReviewView.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 15/07/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit

class ProductReviewView: UIView {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var reviewTextView: UITextView!
    
    var review: ProductReview! {
        didSet {
            dateLabel.text = review.date
            reviewTextView.text = review.text
        }
    }

}
