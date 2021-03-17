//
//  AddCoffeeOrderView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/13/21.
//
//

import SwiftUI

struct AddCoffeeOrderView: View {
    // MARK: - PROPERTIES

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()

    // MARK: - BODY

    var body: some View {
        NavigationView {
            
            VStack {
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter your name", text: self.$addCoffeeOrderVM.name)
                    } //: SECTION

                    Section(header: Text("SELECT COFFEE").font(.body)) {
                        ForEach(self.addCoffeeOrderVM.coffeeList, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                        } //: LOOP
                    } //: SECTION

                    Section(header: Text("SELECT SIZE").font(.body), footer: OrderTotalView(total: self.addCoffeeOrderVM.total)) {
                        Picker("", selection: self.$addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    } //: SECTION
                } //: FORM
                
                HStack {
                    Button("Place Order") {
                        self.addCoffeeOrderVM.placeOrder()
                        self.presentationMode.wrappedValue.dismiss()
                    } //: BUTTON
                    .padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(.white)
                    .background(Color(red: 46/255, green: 204/255, blue: 113/255))
                    .cornerRadius(10)
                } //: HSTACK
            } //: VSTACK
            .navigationBarTitle("Add Order")
            
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView()
    }
}

struct CoffeeCellView: View {
    let coffee: CoffeeViewModel
    @Binding var selection: String

    var body: some View {
        HStack {
            Image(coffee.imageUrl)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)

            Text(coffee.name)
                .font(.title2)
                .padding([.leading], 20)

            Spacer()

            if (self.selection == self.coffee.name){
                Image(systemName: "checkmark")
                    .padding()
            }
        } //: HSTACK
        .onTapGesture {
            self.selection = coffee.name
        }
    }
}
