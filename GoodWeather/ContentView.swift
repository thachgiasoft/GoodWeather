//
//  ContentView.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter City Name", text: self.$weatherVM.cityName, onCommit:  {
                self.weatherVM.search()
            })
            .font(.custom("Arial", size: 50))
            .padding()
            .fixedSize()
            
            Text(self.weatherVM.temperature)
                .font(.custom("Arial", size: 100))
                .foregroundColor(.white)
                .offset(y: 100)
                .padding()
            
            Text(self.weatherVM.humidity)
                .font(.custom("Arial", size: 100))
                .foregroundColor(.white)
                .offset(y: 100)
                .padding()
            
        } //: VSTACK
        .frame(minWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 0, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color.green)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
