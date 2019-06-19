//
//  ProductsViewController.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 02/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit

protocol ProductsViewControllerInput {
    func layout(sections: [Section])
}

protocol ProductsViewControllerOuput {
    func populateData()
}

class ProductsViewController: UIViewController {
    
    var viewModel = ProductsViewModel()
    
    fileprivate var bestSellerSectionIndex = 0
    
    var bestSellers: [BestSeller] = [BestSeller]() {
        didSet {
            tableView.reloadSections(IndexSet(integer: bestSellerSectionIndex), with: .none)
        }
    }
    
    var sections: [Section] = [Section]() {
        didSet {
            if tableView.numberOfSections < sections.count + 1 {
                self.tableView.reloadSections(IndexSet(integersIn: bestSellerSectionIndex..<sections.count), with: .none)
            }
        }
    }
    
    var category: Category! {
        didSet {
            let categoryHeader = Bundle.main.loadNibNamed("CategoryHeader", owner: nil, options: nil)?.first as! CategoryHeader
            self.tableView.tableHeaderView = categoryHeader
        }
    }
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: BestSellerTableViewSectionHeader.reuseIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: BestSellerTableViewSectionHeader.reuseIdentifier)
        tableView.register(UINib(nibName: CollapsibleTableViewHeader.reuseIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: CollapsibleTableViewHeader.reuseIdentifier)
        setupBindings()
        viewModel.requestData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeHeaderToFit()
    }
    
    fileprivate func sizeHeaderToFit() {
        guard let headerView = tableView.tableHeaderView else { return }
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        let height: CGFloat = 90.0
        var frame = headerView.frame
        frame.size.height = height
        headerView.frame = frame
        tableView.tableHeaderView = headerView
    }
    
    fileprivate func setupBindings() {
        
        // binding bestsellers to product container
        viewModel.onBestSellers = { [weak self] (bestSellers) in
            guard let `self` = self else { return }
            self.bestSellers = bestSellers
        }
        
        // binding sections to product container
        viewModel.onSections = { [weak self] (sections) in
            guard let `self` = self else { return }
            self.sections = sections
        }
    }
}

extension ProductsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == bestSellerSectionIndex {
            let cell: BestSellersTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            cell.bestSellers = bestSellers
            return cell
        }
        let cell: ProductsGridTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.items = sections[indexPath.section-1].items
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == bestSellerSectionIndex {
            return 320.0
        }
        let section = sections[indexPath.section - 1]
        return section.collapsed ? 0 : 280.0
    }
}

extension ProductsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection sectionIndex: Int) -> UIView? {
        if sectionIndex == bestSellerSectionIndex {
            return tableView.dequeueReusableHeaderFooterView(withIdentifier: BestSellerTableViewSectionHeader.reuseIdentifier)
        }
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CollapsibleTableViewHeader.reuseIdentifier) as? CollapsibleTableViewHeader
        let section = sections[sectionIndex - 1]
        header?.delegate = self
        header?.configure(for: section.title, collapsed: section.collapsed, sectionIndex: sectionIndex)
        return header
    }
}

extension ProductsViewController : CollapsibleTableViewHeaderDelegate {
    func collapsableHeader(_ header: CollapsibleTableViewHeader, didTappedToggleButtonFor section: Int) {
        let collapsed = sections[section - 1].collapsed
        sections[section - 1].collapsed = !collapsed
        tableView.reloadSections(IndexSet(arrayLiteral: section), with: .automatic)
    }
}
