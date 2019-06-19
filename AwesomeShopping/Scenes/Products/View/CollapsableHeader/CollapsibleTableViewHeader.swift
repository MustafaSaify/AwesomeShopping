//
//  CollapsableTableViewHeader.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 02/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation
import UIKit

protocol CollapsibleTableViewHeaderDelegate : class {
    func collapsableHeader(_ header: CollapsibleTableViewHeader, didTappedToggleButtonFor section: Int)
}

class CollapsibleTableViewHeader: UITableViewHeaderFooterView, Reusable {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var arrowImageView: UIImageView!
    @IBOutlet var seperatorView: UIView!
    
    var isCollapsed: Bool = true {
        didSet {
            UIView.animate(withDuration: 1, animations: {
                if self.isCollapsed {
                    self.arrowImageView.transform = CGAffineTransform(rotationAngle: 0)
                } else {
                    self.arrowImageView.transform = CGAffineTransform(rotationAngle: .pi)
                }
            })
            self.seperatorView.isHidden = !isCollapsed
        }
    }
    
    weak var delegate: CollapsibleTableViewHeaderDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap(sender:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.arrowImageView.transform = CGAffineTransform(rotationAngle: 0)
    }
    
    func configure(for title: String, collapsed: Bool, sectionIndex: Int) {
        titleLabel.text = title
        isCollapsed = collapsed
        self.tag = sectionIndex
    }
    
    @IBAction func onTap(sender: UIGestureRecognizer?) {
        delegate?.collapsableHeader(self, didTappedToggleButtonFor: self.tag)
    }
    
}
