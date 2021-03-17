//
//  AddOrderView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/14/21.
//
//

import SwiftUI

struct AddOrderView: View {
    // MARK: - PROPERTIES

    @Environment(\.presentationMode) var presentationMode
    @State var addOrderVM = AddOrderViewModel()

    // MARK: - BODY

    var body: some View {
        NavigationView {
            Group {
                VStack {
                    TextField("Enter Name", text: $addOrderVM.name)

                    Picker(selection: $addOrderVM.type, label: Text("")) {
                        Text("Cappuccino").tag("cap")
                        Text("Regular").tag("reg")
                        Text("Expresso").tag("ex")
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    Button("Place Order") {
                        addOrderVM.saveOrder()
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(12)
                } //: VSTACK
            } //: GROUP
            .padding()
            .navigationTitle("Add Order")
        } //: NAV VIEW
    }
}

// MARK: - PREVIEW

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView()
    }
}
