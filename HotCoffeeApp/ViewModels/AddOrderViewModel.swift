//
//  AddOrderViewModel.swift
//  HotCoffeeApp
//
//  Created by Jacob LeCoq on 3/14/21.
//

import Foundation

class AddOrderViewModel {
    var name: String = ""
    var type: String = ""
    
    func saveOrder() {
        CoreDataManager.shared.saveOrder(name: self.name, type: self.type)
    }
}
