//
//  ProductDetailsViewModel.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 15/07/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation

class ProductDetailsViewModel {
    
    var onReviews:((_ sections: [ProductReview]) -> ())?
    var onRelatedProducts:((_ sections: [RelatedProductItem]) -> ())?
    
    func requestData() {
        let dataWorker = ProductDetailsDataWorker()
        
        // BestSellers
        let reviews = dataWorker.productReviews()
        onReviews?(reviews)
        
        //Sections
        let relatedProducts = dataWorker.relatedProducts()
        onRelatedProducts?(relatedProducts)
    }
}
