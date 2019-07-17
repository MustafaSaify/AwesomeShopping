//
//  RelatedProductsContainerTableViewCell.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 15/07/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit

class RelatedProductsContainerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [RelatedProductItem] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        collectionView.layoutIfNeeded()
        
        let topConstraintConstant = contentView.constraint(byIdentifier: "topAnchor")?.constant ?? 0
        let bottomConstraintConstant = contentView.constraint(byIdentifier: "bottomAnchor")?.constant ?? 0
        let trailingConstraintConstant = contentView.constraint(byIdentifier: "trailingAnchor")?.constant ?? 0
        let leadingConstraintConstant = contentView.constraint(byIdentifier: "leadingAnchor")?.constant ?? 0
        
        collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width - trailingConstraintConstant - leadingConstraintConstant, height: 1)
        
        let size = collectionView.collectionViewLayout.collectionViewContentSize
        let newSize = CGSize(width: size.width, height: size.height + topConstraintConstant + bottomConstraintConstant)
        return newSize
    }

}

extension RelatedProductsContainerTableViewCell : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RelatedProductCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        cell.item = items[indexPath.item]
        return cell
    }
}

extension RelatedProductsContainerTableViewCell : PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        let item = items[indexPath.item]
        return item.isCategory ? item.image?.size.height ?? 0.0 : 269.0
    }
    
}
