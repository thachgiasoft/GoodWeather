//
//  CoreDataManager.swift
//  HotCoffeeApp
//
//  Created by Jacob LeCoq on 3/14/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: PersistenceController.shared.container.viewContext)
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext){
        self.moc = moc
    }
    
    private func fetchOrder(name: String) -> Order? {
        var orders = [Order]()
        
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            orders = try self.moc.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return orders.first
    }
    
    func getOrders() -> [Order] {
        var orders = [Order]()
        
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        
        do {
            orders = try self.moc.fetch(orderRequest)
        } catch let err as NSError {
            print("failed to get orders: \(err)")
        }
        
        return orders
    }
    
    func saveOrder(name: String, type: String){
        let cdOrder = Order(context: self.moc)
        cdOrder.name = name
        cdOrder.type = type
        
        do {
            try self.moc.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    func deleteOrder(name: String){
        
        do {
            if let order = fetchOrder(name: name){
                self.moc.delete(order)
                try self.moc.save()
            }
        } catch let error as NSError {
            print(error)
        }
    }
}
