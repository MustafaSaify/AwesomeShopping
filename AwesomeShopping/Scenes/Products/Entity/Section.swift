//
//  Section.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 02/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation
import UIKit

struct Section : Decodable {
    
    var title: String
    var items: [SectionProduct]
    var collapsed: Bool = true
    
    private enum CodingKeys: String, CodingKey {
        case title
        case items
    }
}
