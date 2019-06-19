//
//  CategoryViewModel.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 18/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation

class CategoriesViewModel {
    
    public var onCategories : (([Category])->Void)?
    
    func requestData() {
        let categories = CategoryDataWorker().generateCategories()
        onCategories?(categories)
    }
    
}
