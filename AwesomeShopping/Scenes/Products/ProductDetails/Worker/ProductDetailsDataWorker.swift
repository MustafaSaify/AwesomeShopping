//
//  ProductDetailsDataWorker.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 15/07/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation

class ProductDetailsDataWorker {
    
    func productReviews() -> [ProductReview] {
        guard let url = Bundle.main.url(forResource:"ProductReviews", withExtension: "plist") else {
            return []
        }
        do {
            let data = try Data(contentsOf:url)
            let dict = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String:Any]
            let bestSellers = dict["ProductReviews"] as! [[String : Any]]
            let jsonData = try JSONSerialization.data(withJSONObject: bestSellers , options: .prettyPrinted)
            return try JSONDecoder().decode([ProductReview].self, from: jsonData)
        } catch {
            print(error)
            return []
        }
    }
    
    func relatedProducts() -> [RelatedProductItem] {
        guard let url = Bundle.main.url(forResource:"RelatedProducts", withExtension: "plist") else {
            return []
        }
        do {
            let data = try Data(contentsOf:url)
            let dict = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String:Any]
            let sections = dict["RelatedProducts"] as! [[String : Any]]
            let jsonData = try JSONSerialization.data(withJSONObject: sections , options: .prettyPrinted)
            return try JSONDecoder().decode([RelatedProductItem].self, from: jsonData)
        } catch {
            print(error)
            return []
        }
    }
}
