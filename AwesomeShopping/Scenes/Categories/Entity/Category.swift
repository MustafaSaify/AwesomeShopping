//
//  Category.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 18/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation
import UIKit

struct Category : Decodable {
    var id: Int
    var name: String
    var imageName: String?
}
