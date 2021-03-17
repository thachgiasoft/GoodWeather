//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrdering
//
//  Created by Jacob LeCoq on 3/13/21.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    var name: String = ""
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    var total: Double {
        return calculateTotal()
    }
    
    private var webService: WebService
    
    init(){
        self.webService = WebService()
    }
    
    func placeOrder() {
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        
        self.webService.createCoffeeOrder(order: order) { _ in
            
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return prices[self.size]!
    }
    
    private func calculateTotal() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
}
