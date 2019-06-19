//
//  ProductListViewModel.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 02/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation

class ProductsViewModel {
    
    var onBestSellers:((_ bestSellers: [BestSeller]) -> ())?
    var onSections:((_ sections: [Section]) -> ())?
    
    func requestData() {
        let dataWorker = ProductsDataWorker()
        
        // BestSellers
        let bestSellers = dataWorker.bestSellers()
        onBestSellers?(bestSellers)
        
        //Sections
        var sections = dataWorker.sectionProducts()
        sections[0].collapsed = false
        onSections?(sections)
    }
}
