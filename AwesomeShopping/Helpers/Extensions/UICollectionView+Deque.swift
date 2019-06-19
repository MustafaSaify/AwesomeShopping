//
//  UICollectionView+Deque.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 19/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerNibCell<T: UICollectionViewCell>(cellType: T.Type) {
        let nib = UINib(nibName: String(describing: cellType.self), bundle: nil)
        let reuseIdentifier = String(describing: cellType.self)
        self.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func registerProtoTypeCell<T: UICollectionViewCell>(cellType: T.Type) {
        self.register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Collection View Cell \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UICollectionViewCell : Reusable {}
