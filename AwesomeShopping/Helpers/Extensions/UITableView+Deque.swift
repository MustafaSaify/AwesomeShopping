//
//  UITableView+Deque.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 19/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerNibCell<T: UITableViewCell>(cellType: T.Type) {
        let nib = UINib(nibName: String(describing: cellType.self), bundle: nil)
        let reuseIdentifier = String(describing: cellType.self)
        self.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func registerProtoTypeCell<T: UITableViewCell>(cellType: T.Type) {
        self.register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UITableViewCell : Reusable {}
