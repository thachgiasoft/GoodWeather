//
//  OrderListViewModel.swift
//  HotCoffeeApp
//
//  Created by Jacob LeCoq on 3/14/21.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class OrderListViewModel: ObservableObject {
    @Published var orders: [OrderViewModel] = [OrderViewModel]()
    
    init(){
        fetchAllOrders()
    }
    
    func fetchAllOrders() {
        self.orders = CoreDataManager.shared.getOrders().map(OrderViewModel.init)
        print(self.orders)
    }
    
    func deleteOrder(_ orderVM: OrderViewModel){
        CoreDataManager.shared.deleteOrder(name: orderVM.name)
        fetchAllOrders()
    }
}

class OrderViewModel: Hashable{
    static func == (lhs: OrderViewModel, rhs: OrderViewModel) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(type)
    }
    
    var name: String = ""
    var type: String = ""
    
    init(order: Order){
        self.name = order.name!
        self.type = order.type!
    }
}
