//
//  ProductReview.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 15/07/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation

struct ProductReview : Decodable {
    var rating: Float
    var title: String
    var text: String
    var reviewer: String
    var date: String
}
