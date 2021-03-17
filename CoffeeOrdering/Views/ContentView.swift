//
//  ContentView.swift
//  CoffeeOrdering
//
//  Created by Jacob LeCoq on 3/13/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var orderListVM = OrderListViewModel()
    @State private var isShowingAddOrder: Bool = false
    
    var body: some View {
        NavigationView {
            OrderListView(orders: self.orderListVM.orders)
//                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Coffee Orders").font(.largeTitle).bold()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button(action: {
                            self.isShowingAddOrder = true
                        }) {
                            Image(systemName: "plus")
                        }
                    })
                }
                .sheet(isPresented: self.$isShowingAddOrder, onDismiss: self.orderListVM.fetchOrders){
                    AddCoffeeOrderView()
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
