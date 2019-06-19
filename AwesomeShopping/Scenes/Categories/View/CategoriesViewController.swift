//
//  CategoriesViewController.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 02/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit

protocol CategoriesViewControllerDelegate : class {
    func categories(viewController: CategoriesViewController, didSelected category: Category)
}

class CategoriesViewController: UITableViewController {
    
    var viewModel: CategoriesViewModel = CategoriesViewModel()
    
    var categories: [Category] = [Category]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    weak var delegate: CategoriesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        viewModel.requestData()
        DispatchQueue.main.async {
            self.selectFirstCategoryOnLoad()
        }
    }
    
    fileprivate func setupBindings() {
        
        // binding catgories to category container
        viewModel.onCategories = { [weak self] (categories) in
            guard let `self` = self else { return }
            self.categories = categories
        }
    }
    
    fileprivate func selectFirstCategoryOnLoad() {
        if !categories.isEmpty {
            tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
            delegate?.categories(viewController: self, didSelected: categories.first!)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reuseIdentifier, for: indexPath) as? CategoryTableViewCell else {
            return CategoryTableViewCell()
        }
        cell.category = categories[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        delegate?.categories(viewController: self, didSelected: category)
    }

}
