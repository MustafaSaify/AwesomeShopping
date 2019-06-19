//
//  CategoryTableViewCell.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 18/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var selectionStrip: UIView!
    
    var category: Category! {
        didSet {
            self.categoryImage.image = UIImage(named: category.imageName ?? "")
            self.categoryTitle.text = category.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 2.0
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        containerView.layer.shadowRadius = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStrip.isHidden = !selected
        //categoryImage.tintColor = selected ? .black : .lightGray
    }

}
