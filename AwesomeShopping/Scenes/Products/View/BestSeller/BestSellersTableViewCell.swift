//
//  BestSellerTableViewCell.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 02/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit
import iCarousel

class BestSellersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carousel: iCarousel!
    
    fileprivate var numberOfItemsInCarouselView = 3
    
    var bestSellers: [BestSeller] = [] {
        didSet {
            carousel.reloadData()
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        carousel.bounces = false
        carousel.isPagingEnabled = true
        carousel.type = .linear
    }
}

extension BestSellersTableViewCell : iCarouselDataSource {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        guard !bestSellers.isEmpty else { return 0 }
        let mod = bestSellers.count % numberOfItemsInCarouselView
        let pages = bestSellers.count / numberOfItemsInCarouselView
        return mod == 0 ? pages : pages + 1
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var bestSellerListView: BestSellersTableView! = view as? BestSellersTableView
        if bestSellerListView == nil {
            bestSellerListView = Bundle.main.loadNibNamed("BestSellersTableView", owner: nil, options: nil)?.first as? BestSellersTableView
            bestSellerListView.frame = CGRect(x: 0, y: 0, width: carousel.frame.width, height: carousel.frame.height)
        }
        let startIndex = index * numberOfItemsInCarouselView
        let endIndex = min((startIndex + numberOfItemsInCarouselView - 1), bestSellers.count - 1)
        bestSellerListView?.products = Array(bestSellers[startIndex...endIndex])
        return bestSellerListView
    }
}

