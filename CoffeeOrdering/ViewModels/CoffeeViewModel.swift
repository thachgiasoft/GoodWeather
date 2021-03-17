//
//  CoffeeViewModel.swift
//  CoffeeOrdering
//
//  Created by Jacob LeCoq on 3/13/21.
//

import Foundation

class CoffeeListViewModel {
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {
    
    var coffee: Coffee
    
    init(coffee: Coffee){
        self.coffee = coffee
    }
    
    var name: String {
        return coffee.name
    }
    
    var imageUrl: String {
        return coffee.imageUrl
    }
    
    var price: Double {
        return coffee.price
    }
    
}
