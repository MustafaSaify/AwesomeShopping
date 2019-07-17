//
//  RelatedProduct.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 16/07/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation
import UIKit

struct RelatedProductItem : Decodable {
    var title: String
    
    var details: String?
    
    var imageName: String?
    
    var price: String
    
    var oldPrice: String?
    
    var isCategory: Bool
    
    var image: UIImage? {
        return imageName != nil ? UIImage(named: imageName!) : nil
    }
}
