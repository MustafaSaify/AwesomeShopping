//
//  ProductDetailsViewController.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 15/07/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = ProductDetailsViewModel()
    
    private var productReviewsSectionIndex = 0
    
    var productDetails: ProductDetails! {
        didSet {
            tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .none)
        }
    }
    
    var reviews: [ProductReview] = [] {
        didSet {
            tableView.reloadRows(at: [IndexPath(row: 0, section: productReviewsSectionIndex)], with: .none)
        }
    }
    
    var relatedProducts: [RelatedProductItem] = [] {
        didSet {
            tableView.reloadRows(at: [IndexPath(row: 0, section: productReviewsSectionIndex + 1)], with: .none)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: ProductDetailsSectionHeader.reuseIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: ProductDetailsSectionHeader.reuseIdentifier)
        setupBindings()
        viewModel.requestData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setupBindings() {
        viewModel.onReviews = { [weak self] reviews in
            self?.reviews = reviews
        }
        
        viewModel.onRelatedProducts = { [weak self] products in
            self?.relatedProducts = products
        }
    }
}

extension ProductDetailsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == productReviewsSectionIndex {
            let cell: ProductReviewsTableViewCell = tableView.dequeueReusableCell()
            cell.reviews = reviews
            return cell
        }
        let cell: RelatedProductsContainerTableViewCell = tableView.dequeueReusableCell()
        cell.items = relatedProducts
        return cell
    }
}

extension ProductDetailsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let reviewSectionHeight: CGFloat = 176.0
        return indexPath.section == productReviewsSectionIndex ? reviewSectionHeight : tableView.frame.height - reviewSectionHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection sectionIndex: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProductDetailsSectionHeader.reuseIdentifier) as? ProductDetailsSectionHeader
        let title = sectionIndex == productReviewsSectionIndex ? "REVIEWS (\(reviews.count))" : "YOU MIGHT ALSO LIKE"
        header?.configure(with: title, showRatings: sectionIndex == productReviewsSectionIndex)
        return header
    }
}
