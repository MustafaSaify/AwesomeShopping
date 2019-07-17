//
//  UIView+Extension.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 17/07/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func constraint(byIdentifier identifier: String) -> NSLayoutConstraint? {
        return constraints.first(where: { $0.identifier == identifier })
    }
}
