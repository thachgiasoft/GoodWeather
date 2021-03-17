//
//  Order.swift
//  CoffeeOrdering
//
//  Created by Jacob LeCoq on 3/13/21.
//

import Foundation

struct Order: Codable {
    
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
