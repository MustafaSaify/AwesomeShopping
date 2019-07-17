//
//  BestSeller.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 02/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation
import UIKit

struct BestSeller : Decodable {
    var id: Int
    var title: String
    var details: String?
    var imageName: String?
    var price: String
    var oldPrice: String?
}
