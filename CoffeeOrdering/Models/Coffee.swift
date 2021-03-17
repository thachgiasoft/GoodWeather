//
//  Model.swift
//  CoffeeOrdering
//
//  Created by Jacob LeCoq on 3/13/21.
//

import Foundation

struct Coffee {
    
    let name: String
    let imageUrl: String
    let price: Double
}

extension Coffee {
    
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageUrl: "Cappuccino", price: 2.5),
            Coffee(name: "Expresso", imageUrl: "Expresso", price: 2.1),
            Coffee(name: "Regular", imageUrl: "Regular", price: 1.0),
        ]
    }
}
