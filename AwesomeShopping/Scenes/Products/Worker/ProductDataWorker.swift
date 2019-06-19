//
//  ProductDataWorker.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 19/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation

class ProductsDataWorker {
    
    func bestSellers() -> [BestSeller] {
        guard let url = Bundle.main.url(forResource:"BestSellers", withExtension: "plist") else {
            return []
        }
        do {
            let data = try Data(contentsOf:url)
            let dict = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String:Any]
            let bestSellers = dict["BestSellers"] as! [[String : Any]]
            let jsonData = try JSONSerialization.data(withJSONObject: bestSellers , options: .prettyPrinted)
            return try JSONDecoder().decode([BestSeller].self, from: jsonData)
        } catch {
            print(error)
            return []
        }
    }
    
    func sectionProducts() -> [Section] {
        guard let url = Bundle.main.url(forResource:"SectionItems", withExtension: "plist") else {
            return []
        }
        do {
            let data = try Data(contentsOf:url)
            let dict = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String:Any]
            let sections = dict["Sections"] as! [[String : Any]]
            let jsonData = try JSONSerialization.data(withJSONObject: sections , options: .prettyPrinted)
            return try JSONDecoder().decode([Section].self, from: jsonData)
        } catch {
            print(error)
            return []
        }
    }
}
