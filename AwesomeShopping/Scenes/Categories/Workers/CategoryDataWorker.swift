//
//  CategoryDataWorker.swift
//  AwesomeShopping
//
//  Created by Mustafa Saify on 18/06/19.
//  Copyright © 2019 Mustafa Saify. All rights reserved.
//

import Foundation

struct CategoryDataWorker {
    
    func generateCategories() -> [Category] {
        guard let url = Bundle.main.url(forResource:"Categories", withExtension: "plist") else {
            return []
        }
        do {
            let data = try Data(contentsOf:url)
            let plistData = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String : Any]
            let categoriesData = plistData?["Categories"] as! [[String : Any]]
            let jsonData = try JSONSerialization.data(withJSONObject: categoriesData , options: .prettyPrinted)
            return try JSONDecoder().decode([Category].self, from: jsonData)
        } catch {
            print(error)
            return []
        }
    }
}
