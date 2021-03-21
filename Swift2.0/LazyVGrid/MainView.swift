//
//  MainView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/19/21.
//  
//

import SwiftUI

struct MainView: View {
    // MARK: - PROPERTIES
    
    @State private var sliderValue: CGFloat = 2
    
    let animals = ["🐈","🐆","🦌","🦒","🦏","🐄","🐀","🦩","🦜"]

    // MARK: - BODY

    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: Int(self.sliderValue))
        
        return VStack {
            Slider(value: $sliderValue, in: 2...10, step: 1)
            Text(String(format: "%.0f", self.sliderValue))
            
            ScrollView {
                LazyVGrid (columns: columns, alignment: .leading){
                    ForEach(self.animals, id: \.self) { animal in
                        Text(animal)
                            .font(.custom("Arial", size: 100))
                    }
                }
            } //: SCROLLVIEW
            .navigationTitle("LazyVGrid")
        } //: VSTACK
    }
}

// MARK: - PREVIEW

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
