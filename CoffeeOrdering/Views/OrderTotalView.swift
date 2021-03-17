//
//  OrderTotalView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/13/21.
//  
//

import SwiftUI

struct OrderTotalView: View {
    // MARK: - PROPERTIES

    let total: Double
    
    // MARK: - BODY

    var body: some View {
        HStack(alignment: .center){
            Spacer()
            
            Text(String(format: "$%.2f", self.total))
                .font(.title)
                .foregroundColor(.green)
            Spacer()
        } //: HSTACK
        .padding(10)
    }
}

// MARK: - PREVIEW

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.67)
    }
}
