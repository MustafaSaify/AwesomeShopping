//
//  HomeViewController.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 18/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - SubViews
    @IBOutlet weak var categoriesVCView: UIView!
    
    @IBOutlet weak var productsVCView: UIView!
    
    private lazy var categoriesViewController: CategoriesViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController, to: categoriesVCView)
        
        return viewController
    }()
    
    
    private lazy var productsViewController: ProductsViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController, to: productsVCView)
        
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesViewController.delegate = self
    }
}

extension HomeViewController : CategoriesViewControllerDelegate {
    
    func categories(viewController: CategoriesViewController, didSelected category: Category) {
        productsViewController.category = category
    }
}
