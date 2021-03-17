//
//  ContentView.swift
//  HotCoffeeApp
//
//  Created by Jacob LeCoq on 3/14/21.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @ObservedObject var orderListVM: OrderListViewModel
    
    @State private var isShowingAddOrder: Bool = false

    init() {
        self.orderListVM = OrderListViewModel()
    }
    
    private func delete(at offsets: IndexSet){
        offsets.forEach { index in
            let orderVM = self.orderListVM.orders[index]
            
            self.orderListVM.deleteOrder(orderVM)
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(self.orderListVM.orders, id: \.self) { order in
                    HStack {
                        Image(order.type)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                        
                        Text(order.name)
                            .font(.largeTitle)
                            .padding([.leading], 10)
                        
                    } //: HSTACK
                } //: LOOP
                .onDelete(perform: delete)
            } //: LIST
            .sheet(isPresented: self.$isShowingAddOrder, onDismiss: {
                self.orderListVM.fetchAllOrders()
            }){
                AddOrderView()
            }
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
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
